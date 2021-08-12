# Visualizing average memorability per mascot
library(ggplot2)

x=c(0, 0.128221, 0.012409,
    0.067110, 0.042566, -0.023623,
    0.028283, -0.053254)
y=c(0,0,0,0,0,0,0,0)
mas_data <- data.frame(x=x, y=y)

plot_mas_data <- ggplot(mas_data, aes(x, y)) +
  geom_point() +
  scale_x_continuous(limits = c(-0.10, 0.15))

Barasi <- 0
new_plot <- plot_mas_data +                               # Add vertical line & label
  geom_vline(aes(xintercept = Barasi)) +
  geom_text(aes(Barasi, 0.01, label = "Barasi", hjust = 1))
ChibaKun <- 0.128221
plot <- new_plot +                               # Add vertical line & label
  geom_vline(aes(xintercept = ChibaKun )) +
  geom_text(aes(ChibaKun, 0.005, label = "ChibaKun", hjust = 1))
Fukaya <- 0.012409
plot2 <- plot +                               # Add vertical line & label
  geom_vline(aes(xintercept = Fukaya)) +
  geom_text(aes(Fukaya, 0.01, label = "Fukaya", hjust = 1))
Jarbo <- 0.067110
plot3 <- plot2 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Jarbo)) +
  geom_text(aes(Jarbo, 0.005, label = "Jarbo", hjust = 1))
Kapal <- 0.042566
plot4 <- plot3 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Kapal)) +
  geom_text(aes(Kapal, 0.01, label = "Kapal", hjust = 1))
Kounudoun <- -0.023623
plot5 <- plot4 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Kounudoun)) +
  geom_text(aes(Kounudoun, 0.005, label = "Kounudoun", hjust = 1))
OnoJoe <- 0.028283
plot6 <- plot5 +                               # Add vertical line & label
  geom_vline(aes(xintercept = OnoJoe)) +
  geom_text(aes(OnoJoe, 0.01, label = "OnoJoe", hjust = 1))
Shimanekko <- -0.053254
plot7 <- plot6 +                               # Add vertical line & label
  geom_vline(aes(xintercept = Shimanekko)) +
  geom_text(aes(Shimanekko, 0.005, label = "Shimanekko", hjust = 1))
plot7