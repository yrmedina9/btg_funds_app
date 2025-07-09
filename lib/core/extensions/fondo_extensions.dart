String formatNombreFondo(String raw) {
  return raw
      .replaceAll('_', ' ')
      .replaceAll('-', ' ')
      .toLowerCase()
      .split(' ')
      .map((w) => w.isNotEmpty ? w[0].toUpperCase() + w.substring(1) : '')
      .join(' ');
}
