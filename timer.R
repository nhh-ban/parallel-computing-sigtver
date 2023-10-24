library(tictoc)

tic("solution script")
source("scripts/hw4_solution.r")
toc(log = T)

tic("task 2.2")
source("scripts/hw4_v2.r")
toc(log = T)

tic("task 2.3")
source("scripts/hw4_v2.r")
toc(log = T)


printTicTocLog <-
  function() {
    tic.log() %>%
      unlist %>%
      tibble(logvals = .) %>%
      separate(logvals,
               sep = ":",
               into = c("Function type", "log")) %>%
      mutate(log = str_trim(log)) %>%
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
  }

printTicTocLog() %>%
  knitr::kable()

#Output:

  # |Function type   |Seconds |
  # |:---------------|:-------|
  # |solution script |102.34  |
  # |task 2.2        |74.8    |
  # |task 2.3        |63.89   |

# the last version is fastes. This is because we call this function each time we
# draw a sample from the tweede distribution. We do this operation many times,
# and the saved time is therfore the largest.


