import 'package:btg_funds_app/core/models/fondo_model.dart';

final List<Fondo> fondosMock = [
  Fondo(
    id: 1,
    nombre: "FPV_BTG_PACTUAL_RECAUDADORA",
    montoMinimo: 75000,
    categoria: CategoriaFondo.FPV,
  ),
  Fondo(
    id: 2,
    nombre: "FPV_BTG_PACTUAL_ECOPETROL",
    montoMinimo: 125000,
    categoria: CategoriaFondo.FPV,
  ),
  Fondo(
    id: 3,
    nombre: "DEUDAPRIVADA",
    montoMinimo: 50000,
    categoria: CategoriaFondo.FIC,
  ),
  Fondo(
    id: 4,
    nombre: "FDO-ACCIONES",
    montoMinimo: 250000,
    categoria: CategoriaFondo.FIC,
  ),
  Fondo(
    id: 5,
    nombre: "FPV_BTG_PACTUAL_DINAMICA",
    montoMinimo: 100000,
    categoria: CategoriaFondo.FPV,
  ),
];
