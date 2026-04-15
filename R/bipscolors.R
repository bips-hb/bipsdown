bips_color_list_hex <- list(
  BIPSBlue = rgb(23, 99, 170, maxColorValue = 255),
  BIPSTextGray = rgb(66, 66, 66, maxColorValue = 255),
  BIPSOrange = rgb(250, 133, 55, maxColorValue = 255),
  BIPSGreen = rgb(49, 210, 57, maxColorValue = 255)
)

bips_color_list_rgb <- lapply(bips_color_list_hex, \(x) as.vector(col2rgb(x)))


# $BIPSBlue: "#1763AA"
# $BIPSTextGray: "#424242"
# $BIPSOrange: "#FA8537"
# $BIPSGreen: "#31D239"
