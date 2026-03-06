#survival rate
survival_rate <- prop.table(table(titanic_cleaned$Survived))*100
cat("Not survived",round(survival_rate[1], 2), "%" )
cat("Survived",round(survival_rate[2], 2), "%" )
cat(round(survival_rate[1], 2), "% of passengers did not survive, while", round(survival_rate[2], 2), "% survived.")


#survival rate of children <18
children <- titanic_cleaned[titanic_cleaned$Age <18,]
child_survival <- prop.table(table(chidren$Survived)) * 100



