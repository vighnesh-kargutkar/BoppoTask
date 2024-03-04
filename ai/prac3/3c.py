print("MLDC Vighnesh Kargutkar")
def bayes_theorem(p_H, p_E_given_H):
 
 not_H = 1 - p_H

 p_E_given_not_H= 1 - p_E_given_H

 p_E = p_E_given_H * p_H + p_E_given_not_H* not_H

 p_H_given_E = (p_E_given_H * p_H) / p_E

 return p_H_given_E
p_H = 0.005

p_E_given_H = 0.98

result = bayes_theorem(p_H, p_E_given_H)

# summarize
print('P(H|E) = %.3f%%' % (result * 100))
