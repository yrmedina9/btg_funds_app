int getCrossAxisCount(double width) {
  if (width >= 1024) return 3;
  if (width >= 768) return 2;
  return 1;
}

double getAspectRatio(double width) {
  if (width < 768) return 1;
  if (width < 1024) return 1.3;
  return 1.4;
}