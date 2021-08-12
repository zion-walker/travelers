# Visualizing average memorability per mascot
library(ggplot2)

x=c(0, 0.128221, 0.012409,
    0.067110, 0.042566, -0.023623,
    0.028283, -0.053254)
y=c(0,0,0,0,0,0,0,0)
mas_data <- data.frame(x=x, y=y)

plot_mas_data <- ggplot(mas_data, aes(x, y)) +
  geom_point() +
  scale_x_continuous(limits = c(-0.10, 0.15)) +
  scale_y_continuous(limits = c(0, 0.05)) + 
  theme(panel.background = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank(), 
        axis.title.y = element_blank(), 
        axis.ticks.y = element_blank())
plot_mas_data
  
Barasi <- 0
new_plot <- plot_mas_data +                               # Add vertical line & label
  geom_vline(aes(xintercept = Barasi))
ChibaKun <- 0.128221
plot <- new_plot +                               # Add vertical line & label
  geom_vline(aes(xintercept = ChibaKun ))
Fukaya <- 0.012409
plot2 <- plot +                               # Add vertical line & label
  geom_vline(aes(xintercept = Fukaya))
Jarbo <- 0.067110
plot3 <- plot2 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Jarbo)) 
Kapal <- 0.042566
plot4 <- plot3 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Kapal)) 
Kounudoun <- -0.023623
plot5 <- plot4 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Kounudoun)) 
OnoJoe <- 0.028283
plot6 <- plot5 +                               # Add vertical line & label
  geom_vline(aes(xintercept = OnoJoe)) 
Shimanekko <- -0.053254
plot7 <- plot6 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Shimanekko)) +
  geom_hline(aes(yintercept=0))
plot7