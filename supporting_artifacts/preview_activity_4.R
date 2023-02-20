library(tidyverse)
cereal <- read_csv(here::here("Week4", "cereal.csv"))

cereal_long <- cereal |>
  pivot_longer(cols = c(protein, fat, fiber),
              names_to = "Nutrient",
              values_to = "Amount"
              ) |>
  select(name, Nutrient, Amount)





# joins 



prof_info <- tibble(
  professor = c("Bodwin", 
                "Glanz", 
                "Robinson",
                "Theobold"),
  undergrad_school = c("Harvard", 
                       "Cal Poly",
                       "Winona State University",
                       "Colorado Mesa University"),
  grad_school = c("UNC", 
                  "Boston University", 
                  "University of Nebraska-Lincoln",
                  "Montana State University")
)

prof_course <- tibble(
  professor = c("Bodwin", "Robinson", "Theobold", "Carlton"),
  Stat_331 = c(TRUE, TRUE, TRUE, TRUE),
  Stat_330 = c(FALSE, TRUE, FALSE, FALSE),
  Stat_431 = c(TRUE, TRUE, TRUE, FALSE)
)

course_info <- data.frame(
  course = c("Stat_331", "Stat_330", "Stat_431"),
  num_sections = c(8, 3, 1)
)

# answers

prof_info |>
  inner_join(prof_course, by = "professor")

inner_join(prof_info, prof_course)


prof_course |>
  inner_join(prof_info, by = "professor")

right_join(prof_info, prof_course)


prof_course |>
  pivot_longer(cols = c("Stat_331", "Stat_330", "Stat_431"),
               names_to = "course",
               values_to = "can_teach"
               ) |>
  full_join(course_info, by = "course")



