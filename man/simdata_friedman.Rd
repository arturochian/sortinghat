\name{simdata_friedman}
\alias{simdata_friedman}
\title{Generates data from 3 multivariate normal data populations having the
covariance structure from Friedman (1989).}
\usage{
  simdata_friedman(n = rep(15, K), p = 10, experiment = 1,
    seed = NULL)
}
\arguments{
  \item{n}{a vector (of length 3) of the sample sizes for
  each population}

  \item{p}{number of features of the generated data}

  \item{experiment}{the experiment number from the RDA
  paper}

  \item{seed}{seed for random number generation (If
  \code{NULL}, does not set seed)}
}
\value{
  named list containing: \describe{ \item{x:}{A matrix
  whose rows are the observations generated and whose
  columns are the \code{p} features (variables)}
  \item{y:}{A vector denoting the population from which the
  observation in each row was generated.} }
}
\description{
  In a widely cite paper, Friedman (1989) described six
  simulation configurations to study classifiers. This
  function provides an interface to all six configurations.
}
\details{
  We generate \eqn{n_k} observations \eqn{(k = 1, \ldots,
  K)} from each of \eqn{K = 3} multivariate normal
  distributions. Let the \eqn{k}th population have a
  \eqn{p}-dimensional multivariate normal distribution,
  \eqn{N_p(\mu_k, \Sigma_k)} with mean vector \eqn{\mu_k}
  and positive-definite covariance matrix \eqn{\Sigma_k}.
  Each covariance matrix \eqn{\Sigma_k} consists of a
  covariance structure based on the experiment chosen.

  Here, we provide a brief description of each of the six
  experimental configurations. For more information, see
  Friedman (1989). We use Friedman's original setup except
  we fix the number of observations rather than randomly
  choosing the number of class observations.

  Define \eqn{I_p} as the \eqn{p}-dimensional identity
  matrix.

  Experiment #1 -- Equal, Spherical Covariance Matrices

  Each of the three classes are generated from a population
  with covariance matrix, \eqn{I_p}. The population mean of
  the first class is the origin. The means of the other two
  classes are taken to be 3.0 in two orthogonal directions.

  Experiment #2 -- Unequal, Spherical Covariance Matrices

  Let each of the classes have covariance matrix \eqn{k
  *I_p}, where \eqn{k} is the class number \eqn{(1 \le k
  \le 3)}. Similar to experiment #1, the population mean of
  the first class is the origin; the means for classes 2
  and 3 are shifted in orthogonal directions, class 2 by a
  distance of 3.0 and class 3 by a distance of 4.0.

  Experiment #3 -- Equal, Highly Ellipsoidal Covariance
  Matrices

  The covariance matrices of all three classes are equal
  and highly ellipsoidal. The location differences between
  the classes are concentrated in the low-variance
  subspace. The \eqn{j}th eigenvalue \eqn{(j = 1, \ldots,
  p)} of the common covariance matrices is \deqn{e_j = [9
  (j - 1) / (p - 1) + 1]^2,} so that the ratio of the
  largest to smallest eigenvalues is 100.

  The population mean of the first class is the origin. The
  mean vectors for the second and third classes are in
  terms of the population eigenvalues. The mean of the
  \eqn{j}th feature for class 2 is \deqn{\mu_{2j} = 2.5
  \sqrt{e_j / p} \frac{p - j}{p/2 - 1},} where \eqn{e_j} is
  the \eqn{j}th eigenvalue given above. The mean of the
  \eqn{j}th feature for class 3 is \deqn{\mu_{3j} = (-1)^j
  \mu_{2j}.}

  Experiment #4 -- Equal, Highly Ellipsoidal Covariance
  Matrices

  Similar to Experiment #3, the covariance matrices of all
  three classes are equal and highly ellipsoidal. However,
  in this experiment the location differences between the
  classes are concentrated in the high-variance subspace.
  The \eqn{j}th eigenvalue \eqn{(j = 1, \ldots, p)} of the
  common covariance matrices is \deqn{[9 * (j - 1) / (p -
  1) + 1]^2,} so the ratio of the largest to smallest
  eigenvalues is 100.

  The population mean of the first class is the origin. The
  mean vectors for the second and third classes are in
  terms of the population eigenvalues. The mean of the
  \eqn{j}th feature for class 2 is \deqn{\mu_{2j} = 2.5
  \sqrt{e_j / p} \frac{j - 1}{p/2 - 1},} where \eqn{e_j} is
  the \eqn{j}th eigenvalue given above. The mean of the
  \eqn{j}th feature for class 3 is \deqn{\mu_{3j} = (-1)^j
  \mu_{2j}.}

  Experiment #5 -- Unequal, Highly Ellipsoidal Covariance
  Matrices

  In this experiment, the class covariance matrices are
  highly ellipsoidal and very unequal. The eigenvalues for
  the first class are given by \deqn{e_{1j} = [9 (j - 1) /
  (p - 1) + 1]^2,} so that the ratio of the largest to
  smallest eigenvalues is 100. The eigenvalues for the
  second class are \deqn{e_{2j} = [9 (p - j) / (p - 1) +
  1]^2.} The eigenvalues for class 3 are given by
  \deqn{e_{3j} = \{9 [j - (p - 1) / 2] / (p - 1) \}^2.}

  For the first two classes, the ratio of the largest to
  the smallest eigenvalues is 100, but their high and low
  variance subspaces are complementary of each other. This
  ratio for the third class is \eqn{(p + 1)^2}. The third
  class has low variance in the subspace of intermediate
  variance for the first two classes, and high variance
  where they have their complementary high/low variances.

  Each class' mean vector is the origin so that the class
  distributions differ only in their covariance matrices.

  Experiment #6 -- Unequal, Highly Ellipsoidal Covariance
  Matrices

  This experiment uses the same covariance structures
  described for Experiment #5. The population means,
  however, are different. The mean vector of the first
  class is the origin. The mean of the \eqn{j}th feature
  for class 2 is \deqn{\mu_{2j} = 14 / \sqrt{p},} and class
  3's mean vector is defined such that \deqn{\mu_{3j} =
  (-1)^j \mu_{2j}.}
}
\examples{
# Generates 10 observations from three multivariate normal populations having
# the covariance structure given in Friedman's (1989) fifth experiment.
sample_sizes <- c(10, 20, 30)
p <- 20
data <- simdata_friedman(n = sample_sizes, p = p, experiment = 5, seed = 42)
dim(data$x)
table(data$y)

# Generates 15 observations from each of three multivariate normal
# populations having the covariance structure given in Friedman's (1989)
# sixth experiment.
sample_sizes <- c(15, 15, 15)
p <- 20
set.seed(42)
data2 <- simdata_friedman(n = sample_sizes, p = p, experiment = 6)
dim(data2$x)
table(data2$y)
}
\references{
  Friedman, J. H. (1989), "Regularized Discriminant
  Analysis," Journal of American Statistical Association,
  84, 405, 165-175.
}

