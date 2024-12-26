#	Identification of five cytotoxicity-related genes involved in the progression of breast cancer
# setwd("F:/Bversity/Term 1/Data_Analysis _Visualization/Practice")

#installing libraries
install.packages("tidyverse")
install.packages("BiocManager")
BiocManager::install("GEOquery")

#Loading libraries
library(dplyr)
library(tidyverse)
library(GEOquery)
library(readr)

# read the data
data <- read.csv(file = "../Practice/GSE183947_fpkm.csv")
dim(data)

#get the metadata
gse <- getGEO(GEO="GSE183947" , GSEMatrix = TRUE )
gse

metadata <- pData(phenoData(gse[[1]]))
head(metadata)

metadata_subset <- select(metadata, c(1,10,11,17))

metadata_modified <- metadata %>%
  select(1,10,11,17)%>%
  rename(tissue = characteristics_ch1)%>%
  rename(metastasis = characteristics_ch1.1) %>%
  mutate(tissue = gsub("tissue:" , "", tissue )) %>%
  mutate(metastasis = gsub("metastasis:", "", metastasis))

head(data)

#reshaping the data
data_long <- data %>%
  rename(gene = X)%>%
  gather(key = "samples", value = "fpkm" , -gene) #-gene is given to exclude this particular gene column.

#joining metadata and data_long
 data_long <- data_long %>% 
  left_join(.,metadata_modified, by = c("samples" = "description"))

#exploring the dataset
 data_long %>%
   filter(gene == "BRCA1" | gene == "BRCA2") %>%
   group_by(gene,tissue) %>%
   summarise(mean = mean(fpkm),median = median(fpkm)) %>%
   arrange(-mean) %>%
   head()

 #Visualization - ggplot2
 #Loading libraries
 library(tidyverse)
 library(ggplot2)

 #basic format use for ggplot
# ggplot(data, aes=(x = "", y= "")) +
# geom_col
#Barplot 
data_long %>%
  filter(gene == "BRCA1")%>%
  ggplot(., aes(x= samples, y = fpkm, fill = tissue )) +
  geom_col()

#Density plot
data_long %>%
  filter(gene == "BRCA1") %>%
  ggplot(.,aes(x=fpkm, fill= tissue))+
  geom_density(alpha = 0.3)

#boxplot
data_long%>%
  filter(gene == "BRCA1")%>%
  ggplot(., aes(x= metastasis, y = fpkm)) +
  geom_boxplot()

#voilin plot
data_long%>%
  filter(gene == "BRCA1")%>%
  ggplot(., aes(x= metastasis, y = fpkm)) +
  geom_violin()

#scatter plot
data_long %>%
  filter(gene =="BRCA1"| gene == "BRCA2")%>%
  spread(key=gene,value = fpkm)%>%
  ggplot(.,aes(x=BRCA1, y=BRCA2,color=tissue))+
  geom_point()+
  geom_smooth(method="lm", se= FALSE)

#heat map
genes_of_interest<- c("BRCA1","BRCA2", "TP53","ALK", "MYCN")
png("heatmap.png",width=10,height=8)#to save the plots created
h <- data_long %>%
  filter(gene %in% genes_of_interest)%>%
  ggplot(.,aes(x=samples,y=gene,fill=fpkm))+
  geom_tile() +
  scale_fill_gradient(low='white',high='red')
dev.off()

