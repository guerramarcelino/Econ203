# Econ203
203 Lab Sessions for **R-users**. 

**Warning to Econ 203 students: you must know how to do it using Excel**. This is just for fun! Also, you are more than welcome to improve the code!

## Sessions


***TA session 1*** 

[lec1.R](https://github.com/guerramarcelino/Econ203/blob/master/lec1.R) - Review #1 Question 1. 

***TA session 2*** 

[lec2.R](https://github.com/guerramarcelino/Econ203/blob/master/lec2.R) - HW #2 Question 12 and HW #3 Question 12  (download "debtequityv1"). 

***TA session 3*** 

[lec3_2.R](https://github.com/guerramarcelino/Econ203/blob/master/lec3_2.R) - HW #4 Question 5 **plus** drawing the Chi-square distribution using ggplot2.

***TA session 4***

[lec4_2.R](https://github.com/guerramarcelino/Econ203/blob/master/lec4_2.R) - HW #6 Question 6 and HW #7 Question 4 (download "yellow_pagesv4" and "fiberv3").

***TA session 5***

[lec5_2.R](https://github.com/guerramarcelino/Econ203/blob/master/lec5_2.R) - HW #9 Question 2 and HW #9 Question 5 (download "furniture_design_v1").

***TA session 8***

[lec9.R](https://github.com/guerramarcelino/Econ203/blob/master/lab8.R) - Example PISA x Government Efficiency and HW #16 Question 5 (download "data_HW14Q4" and "laurelistanv3").

***TA session 9***

[lec9.R](https://github.com/guerramarcelino/Econ203/blob/master/lec9.R) - Example PISA x Government Efficiency and HW #16 Question 5 (download "PISAxGovEfic" and "StudyGradesv3").

***TA session 10***

[lec10.R](https://github.com/guerramarcelino/Econ203/blob/master/lec10.R) - HW #18 Question 3, HW #18 Question 6 and HW #19 Question 2 (download "quizScorev3",  	"ski_resortv3" and	"trees_are_goodv4").

## Research Project

### Plotting data with ggplot2
Before running regressions, it is a good idea to summarize the data with some statistics - mean, max, min, median, etc - and create plots and graphs. The following code will help you to create more organized scatter plots for your research project. The example can be found in lab session week 3 "PISA_and_GovSpend.png".  

```R
## If you don't have the following packages, start with 
## install.packages("ggrepel"), install.packages("ggplot2") ...
require(ggrepel)
require(ggplot2) 
require(ggthemes)
require(extrafont)
require(grid) 
require(cowplot) 
require(xlsx)
## Setting up your working directory
setwd("C:/Users/marce/Desktop/PhD/Semestre 4/Econ203 Spring 2019/TA/3") 
## Download the file dataPISA.xlsx first
PISA<-read.xlsx("dataPISA.xlsx", sheetName = "database", as.data.frame = T, header = T)
View(PISA)


plot1 <-  ggplot(PISA, aes (x=Gov_spend_educ, y=LnScore_PISA_MATH)) +
  geom_point(aes(color = Continent),
             shape=21, 
             fill= "White",
             size =3, 
             stroke=1.5) +
 geom_smooth(aes(fill="red"),method = "lm", 
              formula = y ~ x,
              se=FALSE, 
              linetype=1 , 
              color= "red") +
  geom_text_repel(data=PISA,
                  aes(label=Country)) +
   scale_color_manual( values = c("#924F3E", "#099FDB", "#29B00E", "#208F84", "darkorange", "#23576E")) +
  scale_fill_manual(name='', values=c("red"),labels=c("R-squared=3.6%")) +
   theme(legend.position="top",
          legend.title = element_blank(),
          legend.box = "horizontal" ,
          legend.text=element_text(size=11)) +
  guides(col = guide_legend(nrow = 1)) +
   theme(panel.grid.minor = element_blank(), 
          panel.grid.major = element_line(color = "gray50", size = 0.5),
          panel.grid.major.x = element_blank(),
          panel.background = element_blank(),
          line = element_blank()) +
  scale_x_continuous(name = "Government Spending in Education (% GDP)") +
  scale_y_continuous(name = "Students' Perfomance on Math - PISA 2012") +
  theme(axis.ticks.length = unit(.15, "cm"),
        axis.ticks.y = element_blank(),
        axis.title.x = element_text(color="black", 
                                    size=12,
                                    face="italic"),
        axis.title.y = element_text(color="black",
                                    size=12,
                                    face="italic"))
plot1

```

**In order to understand better the code and get comfortable with ggplot, read the step-by-step version of the plot** [here](http://rstudio-pubs-static.s3.amazonaws.com/284329_c7e660636fec4a42a09eed968dc47f32.html).

![plot1](https://github.com/guerramarcelino/Econ203/blob/master/plot1.png)


You can also check the interactive version [here](https://plot.ly/~marcelinobguerra/82.embed).
