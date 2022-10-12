context("valmeta 0. calculation of c-statistic")
skip_on_cran()


test_that("Transformation of the c-statistic", {
  fit <- atefitcount(cate.model = y ~ age + female + previous_treatment +
                       previous_cost + previous_number_relapses + offset(log(years)),
                     ps.model = trt ~ age + previous_treatment,
                     data = countExample,
                     seed = 999)


 #expect_equal(ft1, ft2)

})
