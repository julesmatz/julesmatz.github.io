# Probability
> Probability is a mathematical language for quantifying uncertainty. [^1]
## Sample space, outcomes, events
The sample space \(\Omega\) is the set of all possible outcomes of random experiment.  
An event \(A\) is a subset of \(\Omega\). If the outcome of an experiment is included in \(A\), then \(A\) has occurred.

**Examples**

- Two successive coin flips, \(\Omega=\left\lbrace HH,HT,TH,TT\right\rbrace\)  
Event "at least one head" is \(A=\left\lbrace HH,HT,TH\right\rbrace\)
- Height of a person, \(\Omega = \left[0, +\infty\right)=\mathbb{R}^+\)  
Event "small person" is \(A=\left[0, 1.60\text{m}\right[\)
- word2vec, \(\Omega=\left\lbrace \text{ace}, \text{cat}, \ldots, \text{zebra}\right\rbrace\)  
Event "adjective" is \(A=\left\lbrace\text{accurate},\text{calm},\ldots,\text{zealous}\right\rbrace\)


## Probability
The probability \(P(A)\) asssigns a numerical value to event \(A\) so as to quantify its uncertainty.

A probability measure \(P\) must satisfies the axioms:

- \(P(A) \geq 0\) for all \(A \in \Omega\)
- \(P(\Omega\)=1\)
- for disjoint events, \(P(A_1 \cup \ldots \cup A_n)= P(A_1) + \ldots + P(A_n)\) 

#### Frequentist and Bayesian interpretations
- Frequentist: \(P(A)\) is the proportion of \(A\) occuring for infinite repetitions
- Bayesian: \(P(A)\) quantifies our subjective degree of belief about the realization of \(A\)


#### Conditional probability
_Conditional probability_ of \(A\) given \(B\) is 

$$
P(A|B) = \frac{P(A,B)}{P(B)}
$$

which can be rearranged as

$$
P(A,B) = P(A|B)P(B) = P(B|A)P(A)
$$

\(A\) and \(B\) are _independent_ iff

$$
P(A|B)=P(A)
$$

#### Law of total probability
If \(A_1,\ldots,A_n\) is a partition (disjoint subsets that form \(\Omega\)), then for any event \(B\),

$$
P(B) = \sum_{i=1}^n P(B|A_i)P(A_i)
$$

For an event conditioned on a continuous random variable \(X\) with PDF \(f_X\),

$$
P(B) = \int_\mathbb{R} P(B|X=x)f_Xdx
$$

## Odds
Odds express relative likelihood between events. For a single event, odds relate to probability as

$$
O(A) = \frac{P(A)}{1-P(A)} \iff P(A) = \frac{O(A)}{1+O(A)}
$$

The relative likelihood between multiple disjoints events \((A_1, A_2 \ldots, A_n)=\mathbf{A}\) is expressed as a list (up to a scaling factor)

$$
\begin{aligned}
O(\mathbf{A})&=\left(a_1 : a_2 \ldots : a_n\right) \\
&=\left(P(A_1) : P(A_2) : \ldots : P(A_n)\right)
\end{aligned}
$$

#### Log-odds
Log-odds are \(\log\left(O(A)\right)\), it is very useful in Bayesian update, as it turns multiplications into additions.  
Using the natural logarithm, the value is expressed in _nats_ (natural units of information), while using the base-2 logarithm it is expressed in _bits_.




[^1]: L. Wasserman, 2004, _All of Statistics: A Concise Course in Statistical Inference_, Springer texts in statistics.