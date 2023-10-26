library(tictoc)

tic("solution script")
source("scripts/hw4_solution.r")
toc(log = T)

tic("task 2.2")
source("scripts/hw4_v2.r")
toc(log = T)

tic("task 2.3")
source("scripts/hw4_v3.r")
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
# |solution script |83.64   |
# |task 2.2        |73.37   |
# |task 2.3        |85.58   |

# the second version is fastest. 


