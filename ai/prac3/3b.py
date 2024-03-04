print("MLDC Vighnesh Kargutkar")
def bayes_theorem(P_E1, P_E2, P_A_given_E1, P_A_given_E2):
 
 P_A=  P_A_given_E1* P_E1 +  P_A_given_E2 * P_E2
 
 P_E1_given_A = (P_A_given_E1* P_E1) / P_A

 return P_E1_given_A

P_E1 = 0.5
P_E2 = 0.5

P_A_given_E1= 0.6

P_A_given_E2 = 0.42

result = bayes_theorem(P_E1, P_E2, P_A_given_E1, P_A_given_E2)

print('P(E1|A) = %.3f%%' % (result * 100))
