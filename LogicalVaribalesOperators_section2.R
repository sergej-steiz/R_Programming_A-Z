# logical:
#TRUE T
#FALSE F

4 < 5
10 > 100
4 == 5
# ==
# !=
# <
# >
# <=
# >=
# !
# |
# &
# isTRUE(x)

result <- 4 < 5
result
typeof(result)

result2 <- !TRUE
result2

result3 <- !(5 > 1)

result | result2
result & result2

isTRUE(result | result2)
isTRUE(result & result2)

