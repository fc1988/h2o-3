setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source("../../scripts/h2o-r-test-setup.R")

# problem with merge.
test <- function() {
    # wendy code
    browser()
    left <- data.frame(fruit = c(2,3,0,256,257,518,1028), color <- c('red', 'orange', 'yellow', 'red', 'blue', 'purple', 'cyan'))
    right <- data.frame(fruit = c(2,1,3,258,518,517,1030,1028), citrus <- c(FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE))
    left_hf <- as.h2o(left)
    right_hf <- as.h2o(right)
    
    merged <- h2o.merge(left_hf, right_hf, all.x = TRUE)
    print(merged)
    
    # customer code
    left <- data.frame(fruit = c(-177000000, -4000000, 100000000000, 200000000000, 1000000000000),
                       color <- c('red', 'orange', 'yellow', 'red', 'blue'))

    right <- data.frame(fruit = c(-177000000), citrus <- c(FALSE))

    left_hf <- as.h2o(left)
    right_hf <- as.h2o(right)

    merged <- h2o.merge(left_hf, right_hf, all.x = TRUE)
    print(merged)

    # example from Neema
    left <- data.frame(fruit = c(-177000000, -4000000, 100000000000, 200000000000, 1000000000000),
                       color <- c('red', 'orange', 'yellow', 'red', 'blue'))
    right <- data.frame(fruit = c(-177000000, -177000000),
                        citrus <- c(FALSE))
    left_hf <- as.h2o(left)
    right_hf <- as.h2o(right)
    merged <- h2o.merge(left_hf, right_hf, all.x = TRUE)
    
}

doTest("PUBDEV-3567", test)
