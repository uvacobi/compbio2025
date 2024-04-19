library(ggplot2)
library(gifski)
library(gganimate)

walk <- function(steps, restart_prob=0) {
    x <- vector(length=steps)
    y <- vector(length=steps)
    x[1] <- 0
    y[1] <- 0
    c <- restart_prob
    for (i in 2:steps) {
        should_return <- rbinom(1,1,c)
        if (should_return == 1) {
            x[i] <- 0
            y[i] <- 0
        } else {
            direction <- rbinom(1, 1, 0.5)
            amt <- sample(c(-1,1), 1)
            if(direction==0) {
                x[i] <- x[i-1] + amt
                y[i] <- y[i-1]
            } else {
                x[i] <- x[i-1]
                y[i] <- y[i-1] + amt
            }
        }
    }
    return(data.frame(x,y, ite=1:steps))
}

df <- walk(1000, 0)
p <- ggplot(df, aes(x,y)) +
  geom_point(size=2) + geom_path(alpha=0.3) +
  labs(title="ite: {frame_along}") +
  theme_bw() + 
  coord_cartesian(xlim=c(-20,20), ylim=c(-20,20))

a <- p + transition_reveal(along=ite) 

aa <- animate(a, duration = 5, fps = 10, width = 600, height = 600, renderer = gifski_renderer())
anim_save(filename="random_walk.gif", animation=aa)

df <- walk(1000, 0.2)
p <- ggplot(df, aes(x,y)) +
  geom_point(size=2) + geom_path(alpha=0.3) +
  labs(title="ite: {frame_along}, restart=0.2") +
  theme_bw() + 
  coord_cartesian(xlim=c(-20,20), ylim=c(-20,20))

a <- p + transition_reveal(along=ite)
aa <- animate(a, duration = 5, fps = 10, width = 600, height = 600, renderer = gifski_renderer())
anim_save(filename="random_walk_some_restart.gif", animation=aa)


df <- walk(1000, 0.5)
p <- ggplot(df, aes(x,y)) +
  geom_point(size=2) + geom_path(alpha=0.3) +
  labs(title="ite: {frame_along}, restart=0.5") +
  theme_bw() + 
  coord_cartesian(xlim=c(-20,20), ylim=c(-20,20))

a <- p + transition_reveal(along=ite)
aa <- animate(a, fps = 10, width = 600, height = 600, renderer = gifski_renderer())
anim_save(filename="random_walk_lots_restart.gif", animation=aa)



