# IMPORTING LIBRARIES 
library(rvest)
library(dplyr)

#SCRAPIN WEBSITE
link <- "https://www.imdb.com/list/ls049253935/"

#HTML ELEMENTS FROM WEBSITE
web <-read_html(link)

#SEGREGATING NAMES
name <-web %>% html_nodes(".lister-item-header a") %>% html_text()

#VIEWING NAME LIST
View(name)

#SEGARETING YEARS
time<- web %>% html_nodes(".runtime") %>% html_text()

#VIEW time LIST
View(time)

#SEGREGATING RATINGS
ratings <- web %>% html_nodes(".ipl-rating-star.small .ipl-rating-star__rating") %>% html_text()

#VIEW RARING LIST
View(ratings)

# CREATING DATAFRAME
imdb.ratings <- data.frame(name,time,ratings)

# VIEW DATAFRAME
View(imdb.ratings)

# SAVINIG DATA
write.csv(imdb.ratings, "my crime movie data.csv")

