**Estudiante:** Ángel Hidalgo Morales
**Curso:** 2º ASIR

---

- **Vagrant**: Herramienta CLI para la creación y gestión de entornos de desarrollo virtualizados de forma reproducible y portable. Resuelve el problema del *"en mi equipo funciona"* encapsulando la infraestructura en código.
- **Anfitrión (Host)**: Sistema operativo base donde se ejecuta Vagrant y el hypervisor.
- **Proveedor (Provider)**: Motor de virtualización encargado de gestionar las máquinas virtuales (ej. VirtualBox, VMware).
- **Box**: Plantilla empaquetada o imagen base del sistema operativo utilizada como punto de partida.
- **Máquina Virtual (Guest)**: Instancia aislada generada sobre el proveedor.


El archivo `Vagrantfile` está escrito en **Ruby** (utilizando su sintaxis de DSL).

- **Provisioner**: Mecanismo de Vagrant para automatizar la instalación de software tras el arranque de la VM. Se ejecuta dentro de la máquina virtual (`Guest`) con privilegios de superusuario (`root`).
- **Diferencia entre `inline:` y `path:`**:
  - `inline:` Escribe los comandos Bash directamente en el `Vagrantfile`.
  - `path:` Hace referencia a un script externo (ej. `setup_apache.sh`).
- **Modificación del script**: Si se modifica el script tras el primer `vagrant up`, no se aplica automáticamente. Para forzar su reejecución se utiliza `vagrant provision` o `vagrant reload --provision`.

- **Red por defecto (NAT)**: Es la primera interfaz (`eth0`) asignada por Vagrant para mantener comunicación SSH y otorgar salida a Internet.
- **Diferencias entre redes**:
  - **NAT**: Permite salida a Internet a la VM. El anfitrión no puede acceder directamente a la VM sin reenvío de puertos.
  - **Red Interna (VirtualBox)**: Comunicación exclusiva entre máquinas virtuales dentro del mismo hypervisor.
  - **Red Privada Host-Only**: Comunicación bidireccional entre el anfitrión y la máquina virtual.
  - **Red Pública (Bridged)**: Conecta la VM directamente a la red física local.
- **Diferencia VirtualBox vs VMware**: La red interna de VirtualBox aísla las VMs sin permitir acceso desde el anfitrión. Host-Only en VMware crea un adaptador virtual que permite comunicación Host <-> Guest.
- **Preguntas clave**:
  - Añadir la segunda interfaz **no** elimina la interfaz NAT predeterminada.
  - El reenvío de puertos **no** crea una nueva interfaz, sino que añade un mapeo en el proveedor NAT.

| Orden | Descripción | Ejecutado |
| :--- | :--- | :---: |
| `vagrant up` | Crea y/o arranca la máquina virtual. | [x] |
| `vagrant status` | Muestra el estado actual de la máquina virtual. | [x] |
| `vagrant ssh` | Abre una sesión SSH interactiva dentro de la VM. | [x] |
| `vagrant reload` | Reinicia la VM y aplica cambios del Vagrantfile. | [x] |
| `vagrant provision` | Reejecuta los scripts de aprovisionamiento. | [x] |
| `vagrant halt` | Apaga de forma controlada la VM. | [x] |
| `vagrant destroy` | Elimina completamente la VM y sus recursos. | [x] |



El directorio `/vagrant` dentro de la VM es una carpeta compartida (*Synced Folder*) que mapea en tiempo real el directorio del proyecto situado en el anfitrión.
