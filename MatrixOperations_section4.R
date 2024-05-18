# Matrix Operations

Games
rownames(Games)
colnames(Games)
Games["LeBronJames","2012"]

FieldGoals

FieldGoals/Games
round(FieldGoals/Games)
round(FieldGoals/Games,1)

MinutesPlayed / Games
round(MinutesPlayed / Games)

round(Points / Games)

round(Salary / 1000000,1)

FieldGoalAttempts / FieldGoals

?matplot

matplot(FieldGoals)
# we want to see rows so we need to transpose
t(FieldGoals)

matplot(t(FieldGoals), type = "b", pch = 15:18, col = c(1:4,6))
# you can put a legend on top of existing plot using a legend function
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)

# normalized , means devied by games
matplot(t(FieldGoals/Games), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)

matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)

matplot(t(Salary/MinutesPlayed), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)
