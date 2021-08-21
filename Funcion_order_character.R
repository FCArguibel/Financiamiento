## Funcion para ordenar los lvl de una variable character

reorder_var <- function(df, var_orden, var_factor){
  factores <- df %>% 
    arrange(var_orden)
  
  lvl <- unique(factores$var_factor)
  
  df$var_factor <- factor(var_factor, levels = lvl)
  
}



