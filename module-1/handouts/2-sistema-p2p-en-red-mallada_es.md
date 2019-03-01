Cómo Compartir ficheros p2p sobre una red mesh
===================================

Notas de traducción. Los siguientes conceptos no se han traducido para facilitar futuros textos que podrían estar en inglés sobre conceptos muy relevantes:

- host: la máquina / el equipo
- hostname: nombre de la máquina / el equipo
- mesh: malla, referencia normalmente a red mallada, con las propiedades similares a una malla: redundante (varios caminos)
- gateway: portal; suele ser un intermediario entre dos sistemas, en este caso hace intermediación entre sistema HTTP y IPFS
- file system: sistema de ficheros, supongo que conocerás los famosos FAT32, NTFS. La abreviación FS para filesystem suele aparecer.
- p2p: peer-to-peer, relación entre pares, relación horizontal. Lo contrario es la relación cliente-servidor, relación maestro esclavo.

## Conectando a tu Raspberry Pi

1. Verifica que la Raspberry Pi tiene correctamente conectado tanto el adaptador(es) wifi como la tarjeta SD. Enciende el dispositivo y espera hasta que aparezca una luz verde constante con una luz roja intermitente.

1. Conecta el cliente WiFi de tu ordenador al punto de acceso wifi de la Raspberry Pi:

    - SSID: `<hostname>`
    - Contraseña: `password`

1. Una vez conectado al punto de acceso wifi, puedes acceder al Raspberry Pi por SSH:

    - Host: `<hostname>.local` (or `10.0.0.1`)
    - Usuario: `root`
    - Contraseña: `root`

    En **macOS o Linux** desde el **Terminal**, pon `ssh root@ejemplo.local` y escribe la contraseña de `root`.

    En **Windows** usando la interfaz gráfica de **PuTTY**, pon el `Host`, elige `SSH` y dale al botón `Open` para abrir una sesión SSH. Pon `Usuario` y `Contraseña` cuando te lo pida.

1. Encuentra una Raspberry Pi cerca de ti e intenta hacer un ping para verificar que la interfaz de red mesh está funcionando. Remplaza `ejemplo` y `ejemplo2` con el `hostname` de tu nodo y el nodo más cercano, respectivamente:

    **root@ejemplo:~#** `ping ejemplo2.local`

    Teclea `Ctrl + C` para detener el comando ping.

Ahora eres un operador de nodo mesh usando los comandos de tu propia Raspberry Pi, que está conectada al resto de la red mesh que hemos creado en esta sala! Para el resto de la actividad continuaremos usando `ejemplo` para representar tu nodo, y `ejemplo2` para representar tu nodo más cercano. Asegúrate de remplazar estos con el nombre de tu propia Raspberry Pi y la de tu vecino.

## Arrancar el InterPlanetary File System (IPFS)

1. Arranca IPFS en segundo plano:

    **root@ejemplo:~#** `docker load --input ~/docker/tomeshnet-ipfs-0.1.tar`
    **root@ejemplo:~#** `docker run --name ipfs --network host --detach tomeshnet/ipfs:0.1`

    Con estos dos comandos, estamos utilizando una herramienta que se llama `docker` (que por ahora no vamos a explicar en detalle) que cargar todos los ficheros necesarios para ejecutar IPFS en segundo plano. No verás casi salida visual, pero empezaremos a interactuar con esta aplicación.

1. Inicia una sesión interactiva y escribe un mensaje en el sistema de ficheros p2p: 

    **root@ejemplo:~#** `docker exec -it ipfs sh`
    **/ #** `echo "Hello World" | ipfs add`

    Con el primer comando, se navega a un intérprete de comandos interactivo con acceso a la aplicación IPFS, y con el segundo comando se añade el texto `Hello World` al sistema de ficheros P2P.

1. Copia la dirección del contenido resultante de haber escrito `ipfs add` antes, que ha surgido de una derivación inequívoca del texto anterior `Hello World`. Para leer nuevamente el contenido, usa `ipfs cat` seguido de la dirección del contenido que hayas copiado:

    **/ #** `ipfs cat QmWATWQ7fVPP2EFGu71UkfnqhYXDYH566qy47CnJDgvs8u`

1. Ahora puedes acceder al contenido IPFS que acabas de añadir! Puedes usar una URL con el siguiente formato para así poder acceder al contenido desde el navegador web de tu ordenador:

    `http://<hostname>.local:8080/ipfs/<ipfs-content-address>`

    Por ejemplo:

    `http://ejemplo.local:8080/ipfs/QmWATWQ7fVPP2EFGu71UkfnqhYXDYH566qy47CnJDgvs8u`

    Después debes ver `Hello World` en la ventana de tu navegador web. Esto funciona porque cada nodo corre un ipfs-to-http gateway y que puede ser accedido desde el cliente conectado al punto de acceso del Raspberry Pi.

1. Intenta enviar otro texto y leerlo tanto desde el intérprete como desde el navegador web.

En realidad puedes añadir cualquier tipo de fichero a IPFS, como fotos o vídeos, e independientemente del tamaño del fichero puedes darle una dirección (y verificarlo!) con una dirección URL corta como esta. Hasta ahora hemos creado y accedido al contenido de tu Raspberry Pi, pero no hemos compartir contenido en la red mesh. Vamos a ello!    

## Crear red de contenido IPFS

1. Para poder formar una red se necesitan dos nodos que se conozcan entre sí. Entonces empezaremos por encontrar tu identidad en la red y compartirla con otro nodo:

    **/ #** `ipfs id`

    Verás varias lineas de salida. Anota la dirección que empieza con `/ip6/fc` y que es similar a esta:

    `/ip6/fcb0:3f14:ebc8:1f7b:a1ce:bd44:a410:5049/tcp/4001/ipfs/QmXLWSa1AbLJfivfT9dQJdvs6AsdMkjZjjBMv5SVtimVBq`

    La `/ip6/fc00::/8` es la dirección única de IPv6 de tu nodo de la mesh (explicaremos los direcciones IPv6 en el siguiente taller) y la parte de después de `/ipfs/` es el ID de tu nodo de IPFS. Puedes pensar en IPv6 como la dirección postal de tu Raspberry Pi, donde también se encuentra un nodo de IPFS funcionando, y el ID del nodo IPFS identifica inequívocamente este nodo IPFS del resto de nodos IPFS en el mundo. Copia esta línea en un bloc de notas y pégala en otro nodo. Con estos datos podemos encontrar e identificar tu nodo de IPFS. 

1. Escribe `exit` una vez para salir de la sesión IPFS por ahora. Encuentra un nodo cerca de ti, pide permiso al operador de su mascota-RaspberryPi para acceder a su nodo via SSH y confirma así que ya tienen el IPFS en marcha. Ahora desde la sesión de tu Raspberry Pi, inicia una sesión SSH hacia el nodo vecino: 

    **root@ejemplo:~#** `ssh ejemplo2.local`

1. Sí, estamos en dos capas de SSH, pero está bien :) Ahora iniciaremos una sesión interactiva de IPFS en `ejemplo2`, después añade tu dirección para informarle de tu nodo:

    **root@ejemplo2:~#** `docker exec -it ipfs sh`
    **/ #** `ipfs bootstrap add /ip6/fcb0:3f14:ebc8:1f7b:a1ce:bd44:a410:5049/tcp/4001/ipfs/QmXLWSa1AbLJfivfT9dQJdvs6AsdMkjZjjBMv5SVtimVBq`

    Ahora los nodos están emparejados para formar una red IPFS, que significa que `ejemplo` puede acceder a todo el contenido en la red accesible a `ejemplo2`, y viceversa. No van a hacer falta muchos más emparejamientos para acabar conectando todos los nodos de esta sala.

1. Ahora vamos a añadir algo de contenido sobre `ejemplo2`, y después escribimos `exit` dos veces para poder volver a `ejemplo`, y vamos a tratar de leer el texto desde tu navegador web. Este proceso puede tardar un rato desde que hayas establecido el emparejamiento por primera vez, pero eventualmente el contenido estará accesible por toda la red.

En resumen, se ejecuta la aplicación IPFS y el portal *ipfs-to-http gateway* en un contenedor de docker que está en una Raspberry Pi, luego se empareja con dos nodos para crear una red de contenido accesible con IPFS. Cada nodo de la mesh también es un nodo IPFS que publica y obtiene contenido dentro de nuestra red mesh local.

![Peer-to-peer applications](peer-to-peer-applications.svg)

Puedes identificar dónde está la mascota-RaspberryPi que acabas de construir en el diagrama de arriba?
