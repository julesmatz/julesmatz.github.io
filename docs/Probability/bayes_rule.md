# Bayes' rule
Bayes' rule is a law of probability for updating uncertainty about a hypothesis based on some new data (evidence).

Let us consider throughout this note the example of email classification.  
Out of the last 100 emails, 50 are business, 30 are personal, and 20 are spam.  
The word "meeting" is present in 25 business, 8 personal and 2 spam emails.  
The word "deal" is present in 12 business, 1 personal and 9 spam emails.

### Probability
From the definition of [conditional probability](probability.md#conditional-probability)

$$
P(H|e) = \frac{P(e|H)P(H)}{P(e)}
$$

The denominator can be expanded or integrated out using  and the [law of total probability](probability.md#law-of-total-probability),

$$
\begin{aligned}
P(H_i|e) &= \frac{P(e|H_i)P(H_i)}{P(e)} \\
&= \frac{P(e|H_i)P(H_i)}{\sum_j P(e|H_j)P(H_j)}
\end{aligned}
$$

for a partition \(\left\lbrace H_1,\ldots,H_n\right\rbrace\) (partition=disjoint subsets that form \(\Omega\)).

<details closed>
<summary>Example</summary>
An email is received, it contains the words "meeting" and "deal", let us update our probabilities with one then the other,
$$
P(\text{business}) = 0.5
$$

$$
\begin{aligned}
P(\text{business}|\text{"meeting"}) &= \frac{P(\text{"meeting"}|\text{business})P(\text{business})}{P(\text{"meeting"})} \\
&= \frac{\frac{25}{50}\frac{50}{100}}{\frac{25}{50}\frac{50}{100} + \frac{8}{30}\frac{30}{100} + \frac{2}{20}\frac{20}{100}} \\
&= \frac{\frac{25}{100}}{\frac{25+8+2}{100}} \left(=\frac{P(\text{"meeting"},\text{business})}{P(\text{"meeting"})}\right) \\
&= \frac{25}{34} = 0.71
\end{aligned}
$$

$$
\begin{aligned}
P(\text{personal}|\text{"meeting"}) &= \frac{P(\text{"meeting"}|\text{personal})P(\text{personal})}{P(\text{"meeting"})} \\
&= \frac{\frac{8}{30}\frac{30}{100}}{\frac{25}{50}\frac{50}{100} + \frac{8}{30}\frac{30}{100} + \frac{2}{20}\frac{20}{100}} \\
&= \frac{\frac{8}{100}}{\frac{25+8+2}{100}} \left(=\frac{P(\text{"meeting"},\text{personal})}{P(\text{"meeting"})}\right) \\
&= \frac{8}{34} = 0.23
\end{aligned}
$$

$$
\begin{aligned}
P(\text{spam}|\text{"meeting"}) &= \frac{P(\text{"meeting"}|\text{spam})P(\text{spam})}{P(\text{"meeting"})} \\
&= \frac{\frac{2}{20}\frac{20}{100}}{\frac{25}{50}\frac{50}{100} + \frac{8}{30}\frac{30}{100} + \frac{2}{20}\frac{20}{100}} \\
&= \frac{\frac{1}{100}}{\frac{25+8+2}{100}} \left(=\frac{P(\text{"meeting"},\text{spam})}{P(\text{"meeting"})}\right) \\
&= \frac{1}{34} = 0.06
\end{aligned}
$$

$$
\begin{aligned}
P(\text{business}|\text{"deal"}, \text{"meeting"}) &= \frac{P(\text{"deal"}|\text{business})P(\text{business}|\text{"meeting"})}{P(\text{"deal"})} \\
&= \frac{\frac{12}{50} 0.73}{\frac{12}{50}\frac{50}{100} + \frac{1}{30}\frac{30}{100} + \frac{9}{20}\frac{20}{100}} \\
&= 0.78
\end{aligned}
$$
$$
\begin{aligned}
P(\text{personal}|\text{"deal"}, \text{"meeting"}) &= \frac{P(\text{"deal"}|\text{personal})P(\text{personal}|\text{"meeting"})}{P(\text{"deal"})} \\
&= \frac{\frac{1}{30} 0.23}{\frac{12}{50}\frac{50}{100} + \frac{1}{30}\frac{30}{100} + \frac{9}{20}\frac{20}{100}} \\
&= 0.03
\end{aligned}
$$
$$
\begin{aligned}
P(\text{spam}|\text{"deal"}, \text{"meeting"}) &= \frac{P(\text{"deal"}|\text{spam})P(\text{spam}|\text{"meeting"})}{P(\text{"deal"})} \\
&= \frac{\frac{9}{20} 0.03}{\frac{12}{50}\frac{50}{100} + \frac{1}{30}\frac{30}{100} + \frac{9}{20}\frac{20}{100}} \\
&= 0.12
\end{aligned}
$$
</details>

### Odds
The odds version does not require a normalization,
$$
O(H|e) = \frac{P(e|H)}{P(e|\neg H)}O(H)
$$


<details closed>
<summary>Proof</summary>
$$
\begin{aligned}
O(H|e) = \frac{P(H|e)}{P(\neg H|e)} &= \frac{\frac{P(H|e)P(H)}{P(e)}}{\frac{P(e|\neg H)P(\neg H)}{P(e)}} \\
&= \frac{P(e|H)}{P(e|\neg H)}\frac{P(H)}{P(\neg H)} \\
&= \frac{P(e|H)}{P(e|\neg H)}O(H)
\end{aligned}
$$
</details>



### Log-odds
The log-odds version uses addition,

$$
\log(O(H|e)) = \log\left(\frac{P(e|H)}{P(e|\neg H)}\right)+ \log(O(H))
$$