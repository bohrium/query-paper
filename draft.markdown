## median in tree depth

top K in total order -- linear time by linear-time-selectrank.

## certificates and tree depth

[BLUM](readings/blum.1987.generic-oracle-classes.pdf)

A **query-problem** is a `task` (f:X->Z) and a `menu` (e:X->(Q->A)).  For x in
X, a **certificate** for x is a function (c:S->A) that is a restriction of e(x)
and so that, for all x', c is a restriction of e(x') only when f(x)=f(x').  For
z in Z, a **z-certificate** is a certificate for some x in X with f(x)=z.  The
**z-certificate-complexity** C(z) is the max over x of mins over certificates
for x of certificate length (size of S).  The **certificate-complexity** is the
max over zs of C(z).  The **decision-complexity** D as the minimal depth of
trees solving this task.

When Z=2 and the map e from X to (Q->A) is __surjective__, we have

    D <= C(0) x C(1) <= C^2

In fact, simple repetition of the same idea shows for larger Zs that

    D <= C^2 log(Z)

Blum ([BLUM]() Lemma 2.2) shows this constructively, but the fact that Blum
shows this is obscured by Blum's infinitary setting.  Blum considers oracle
complexity classes with uniformity conditions with no analogue in our setting,
where X (namely, the set of allowed oracles) is uncountably infinite, and
complexity is measured at a coarse grain of polynomial-vs-super-polynomial.  We
translate Blum's algorithm into simple language:

    algo.
        repeat C0 times:
            seek a 1-certificate of length-<=C1 consistent with the transcript
                        so far, or, if none exists, return `0`.
            make all queries mentioned in that certificate, and if all answers
                        match, then return `1`
        seek a 0-certificate of length-<=C0 consistent with the transcript and
                    involving no new queries; return `0` if found, else `1`

PROOF.  Why is this correct?  Well, fix an input x in X.  Suppose f(x)=0, i.e.,
there exists a C0-short 0-certificate c:S->A for x.  Consider one of the loop
iterations involving C1-short 1-certificate c':S'->A.  If S' does not meet S,
then by surjectivity of e there is some c'':(S cup S')->A consistent with both
c and c', an absurdity since c is a 0-certificate and c' is a 1-certificate.
END-OF-PROOF.

Intuitively, C(1) is the number of queries a nondet machine needs and D is the
number of queries a deterministic machine needs.  It is interesting to
generalize now to __alternating machines__ to build up something analogous to
the Polynomial Hierarchy.
