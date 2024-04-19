library(tidyverse)
library(igraph)
library(ggraph)

data <- read_csv("blood.txt")

nodes <- unique(c(data$GENE1, data$GENE2)) %>% enframe(name="id", value="name")

data <- data %>% left_join(nodes, by=c("GENE1"="name")) %>% rename("gene1"="id") %>% left_join(nodes, by=c("GENE2"="name")) %>% rename("gene2"="id", "weight"="WEIGHT") %>% select(gene1, gene2, weight)

g <- graph_from_data_frame(data, directed=FALSE, vertices=nodes)

png("title.png", width=600, height=600, res=100)
ggraph(g, layout = "kk") + geom_edge_link(aes(alpha = weight)) + geom_node_point(size=4, alpha=0.3) + geom_node_text(aes(label=name), repel=TRUE) + theme_classic() + theme(axis.line = element_blank(), axis.ticks = element_blank(), axis.text = element_blank(), axis.title = element_blank())
dev.off()
