# bash-script-for-automated-fsck-on-linux_autocheck-and-repair-disk-partition
An automated Bash script for safely checking and repairing filesystems on Linux-based systems, designed to unmount partitions, run fsck, and then remount them.

English
About the Script

This Bash script is designed to automatically check and repair filesystems on Linux-based systems. It runs the fsck command on each partition of every hard drive, after unmounting them to ensure that the filesystem is not in use. Only filesystems that are generally considered safe for fsck are checked.
Requirements

    Linux-based Operating System (Tested on Fedora)
    Bash Shell
    Root access is required to execute the script

How to Execute

    Download the script to your local machine.

    Open a terminal and navigate to the directory where the script is saved.

    Make the script executable:

    bash

chmod +x script_name.sh

Run the script as superuser:

bash

    sudo ./script_name.sh

Caution

    Ensure you understand what the script does before running it.
    It's recommended to backup important data before running any filesystem operations.
    Running this script will unmount filesystems temporarily, which may interrupt running services or applications.

Español
Acerca del Script

Este script en Bash está diseñado para comprobar y reparar automáticamente los sistemas de archivos en sistemas basados en Linux. Ejecuta el comando fsck en cada partición de cada disco duro, después de desmontarlas para asegurar que el sistema de archivos no esté en uso. Solo se comprueban los sistemas de archivos que generalmente se consideran seguros para fsck.
Requisitos

    Sistema Operativo basado en Linux (Probado en Fedora)
    Shell Bash
    Se requiere acceso de superusuario para ejecutar el script

Cómo Ejecutar

    Descarga el script a tu máquina local.

    Abre una terminal y navega al directorio donde se guarda el script.

    Haz el script ejecutable:

    bash

chmod +x nombre_del_script.sh

Ejecuta el script como superusuario:

bash

    sudo ./nombre_del_script.sh

Precaución

    Asegúrate de entender lo que hace el script antes de ejecutarlo.
    Es recomendable hacer una copia de seguridad de los datos importantes antes de realizar cualquier operación en el sistema de archivos.
    La ejecución de este script desmontará temporalmente los sistemas de archivos, lo que puede interrumpir servicios o aplicaciones en ejecución.
