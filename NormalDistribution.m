function res = NormalDistribution(x, u, var)

res = exp(-((x - u) ^ 2) / (2 * var * var)) / ((2 * var * var * pi) ^ (1 / 2));