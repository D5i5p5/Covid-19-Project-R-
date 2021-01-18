
data= read.csv("D:\\STUDY MATERIALS\\Dataset(Project)\\Dataset\\COVID19_data.csv") 
View(data)
summary(data)

#cleaned up data columns
data_death=as.integer(data$death !=0)
View(data_death)
unique(data_death)

#death rate
sum(data_death)/nrow(data)

#AGE
#claim: people who die are older
dead=data[data$death==1,]
alive=data[data$death==0,]
mean(dead$age)
mean(alive$age)

mean(dead$age,na=TRUE)
mean(alive$age,na=TRUE)

#age difference (we see it is nearly 20) is this statistically significant?
#for this use t.test
#H0= no significant difference
#H1= significant difference
t.test(alive$age,dead$age)
#see that there is 95% percent chance that the diff. between persons alive dead is from 24 years to 16 years
#if p-value<0.05 it rejects null hypothesis
#so people die in corona virus is much older than people donot die
#conclude that this is statistically significant


#gender
#claim:gender has no effect

data$death_dummy=as.integer(data$death!=0)
sum(data$death_dummy)/nrow(data)


men=subset(data,gender=="male")
women=subset(data,gender=="female")
mean(men$death_dummy,na=TRUE)
mean(women$death_dummy,na=TRUE)

#is this significant
t.test(men$death_dummy,women$death_dummy)
#men have higher chance of dying
#reject null hypothesis
#so this is  statistically significant







