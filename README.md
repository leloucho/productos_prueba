# 📱 Electronic Store - Flutter App

Una aplicación Flutter moderna para la gestión de inventario de productos electrónicos, implementada con **Clean Architecture** y **Riverpod** para gestión de estado.

## 🚀 Características

### ✨ Funcionalidades Principales
- 🔐 **Sistema de Login** con interfaz moderna y animaciones
- 📦 **CRUD Completo de Productos** (Crear, Leer, Actualizar, Eliminar)
- 🌐 **Integración con API REST** (Spring Boot + PostgreSQL)
- 🎨 **UI/UX Moderna** con Material Design 3
- 🏗️ **Arquitectura Limpia** (Clean Architecture)
- ⚡ **Gestión de Estado** con Riverpod
- 📱 **Responsive Design** para diferentes dispositivos

### 🎯 Pantallas Implementadas
- **Login Screen**: Autenticación con fondo degradado y animaciones
- **Product List Screen**: Lista de productos con operaciones CRUD
- **Diálogos Modales**: Crear, editar y eliminar productos

## 🏛️ Arquitectura

```
lib/
├── features/producto/
│   ├── domain/          # Entidades, Repositorios y Casos de Uso
│   ├── data/           # Modelos, DataSources y Repositorios
│   └── presentation/   # UI, Estados y Providers
├── screens/            # Pantallas principales
├── widgets/           # Widgets reutilizables
└── main.dart         # Punto de entrada
```

### 📦 Capas de la Arquitectura
- **Domain Layer**: Lógica de negocio pura (Entidades, Use Cases)
- **Data Layer**: Acceso a datos (API REST, Modelos)
- **Presentation Layer**: UI y gestión de estado (Riverpod)

## 🛠️ Tecnologías Utilizadas

- **Flutter** ^3.9.2
- **Riverpod** ^3.0.3 - Gestión de estado
- **HTTP** ^1.5.0 - Llamadas a API REST
- **Freezed** ^3.2.3 - Generación de código inmutable
- **Json Annotation** ^4.9.0 - Serialización JSON
- **Build Runner** ^2.7.1 - Generación de código

## 🔧 Configuración del Proyecto

### Prerrequisitos
- Flutter SDK ^3.9.2
- Dart SDK ^3.9.2
- API Backend corriendo en `http://10.0.2.2:8080/api/productos`

### Instalación

1. **Clonar el repositorio**
```bash
git clone https://github.com/leloucho/productos_prueba.git
cd productos_prueba
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Generar archivos de código**
```bash
dart run build_runner build
```

4. **Ejecutar la aplicación**
```bash
flutter run
```

## 🌐 API Backend

La aplicación se conecta a una API REST con los siguientes endpoints:

- `GET /api/productos` - Obtener todos los productos
- `POST /api/productos` - Crear nuevo producto
- `PUT /api/productos/{id}` - Actualizar producto
- `DELETE /api/productos/{id}` - Eliminar producto

### Modelo de Producto
```json
{
  "id": 1,
  "nombre": "Laptop HP",
  "precio": 1200.50,
  "stock": 10
}
```

## 🎮 Uso de la Aplicación

### Login
1. Ingresa cualquier usuario y contraseña (mínimo 3 caracteres)
2. La app simula autenticación por 2 segundos
3. Automáticamente navega a la lista de productos

### Gestión de Productos
- **Ver productos**: Lista automática al cargar
- **Crear producto**: Botón flotante "+" 
- **Editar producto**: Ícono de edición en cada item
- **Eliminar producto**: Ícono de basura con confirmación
- **Refrescar**: Desliza hacia abajo (pull-to-refresh)
- **Logout**: Botón en la barra superior

## 📱 Screenshots

### Login Screen
- Fondo degradado azul
- Animaciones de entrada
- Formulario validado
- Estado de carga

### Product List Screen
- Lista moderna con cards
- Botones de acción intuitivos
- Estados de carga y error
- Confirmaciones de seguridad

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

## 👨‍💻 Autor

**Jherson** - [leloucho](https://github.com/leloucho)

---

⭐ **¡Dale una estrella si te gusta este proyecto!** ⭐
