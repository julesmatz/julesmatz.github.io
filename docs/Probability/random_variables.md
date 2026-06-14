# Random variables

## Random variable definition
A random variable \(X\) is a function that maps the _sample space_ (set of possible outcomes) of a random experiment to a measurable space \(E\) (usually \(\left\lbrace 0,1\right\rbrace\), \(\mathbb{R}\) or \(\mathbb{R}^n\)).

$$
X:\Omega\mapsto E
$$

**Examples**

- number of heads for two throws \(X:\left\lbrace HH,HT,TH,TT\right\rbrace\mapsto \left\lbrace 0,1,1,2 \right\rbrace\)
- height \(h\) of a person \(X:\mathbb{R}^+\mapsto \mathbb{R}^+\) (identity mapping)
- word2vec \(X:\left\lbrace\text{archive},\text{by},\text{cat},\ldots,\text{zebra}\right\rbrace\mapsto \mathbb{R}^n\)

The introduction of a measurable space allows for computations such as \(E\left[X\right]=0.5\) for \(\left\lbrace H,T \right\rbrace\mapsto \left\lbrace 0,1 \right\rbrace\).


## Event
An event \(A\) is a subset of \(\Omega\), to which a probability may be assigned.

**Examples**

- number of heads for two throws, event of two heads is \(A=\left\lbrace TT\right\rbrace\)
- height \(h\) of a person, event of small person is \(A=\left[0,1.60\text{m}\right]\)
- word2vec, event of adjective is \(A=\left\lbrace\text{accurate},\text{calm},\text{decisive},\ldots,\text{lucky}\right\rbrace\)


## Probability
Probability quantifies  the uncertainty of an event \(A\) (event=subset of \(\Omega\)) by assigning it a numerical value ranging from 0 (impossible) to 1 (certain).

It satisfies the (Kolmogorov) axioms:

- non-negativity, \(P(A) \geq 0\) for all \(A \in \Omega\)
- normalization, \(P(\Omega\)=1\)
- for mutually exclusive events, \(P(A_1 \cup \ldots \cup A_n)= P(A_1) + \ldots + P(A_n)\) 

**Examples**

- \(P(TT) = 1/4=0.25\)
- \(P(h\geq 1.80\text{m})=0.21\)
- \(P(\text{cat})=0.07\)


## Probability distributions
A probability distribution of a RV is the recording of probabilities associated with all outcomes, it fully describe it. It refers to either a

- **Probability mass function** (PMF, for discrete RV),  
the collection of probabilities for every element in \(\Omega\)
- **Probability density function** (PDF, for continuous RV),  
a function \(f_X(x)\) such that \(P(a\leq X \leq b) = \int_a^b f_X(x) dx\)
- **Cumulative distribution function** (CMF, for both discrete and continuous RV),  
a function \(F_X(x)\) such that \(F_X(x) = P(X\leq x)\)

see [lien](https://faculty.nps.edu/rbassett/_book/discrete-random-variables.html)

