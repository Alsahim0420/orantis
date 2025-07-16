import '../domain/entities/novena_entity.dart';

class NovenasData {
  static List<Novena> getAllNovenas() {
    return [
      inmaculadaConcepcion,
      sanJose,
      virgenGuadalupe,
      divinaMisericordia,
      sanAntonio,
      virgenFatima,
    ];
  }

  static List<Novena> getNovenasByCategory(String category) {
    return getAllNovenas()
        .where((novena) => novena.category == category)
        .toList();
  }

  // Novena a la Inmaculada Concepción
  static final Novena inmaculadaConcepcion = Novena(
    id: 'inmaculada_concepcion',
    title: 'Novenas de la Inmaculada Concepción',
    subtitle: 'A la Virgen María sin pecado original',
    description:
        'Reza durante nueve días para honrar a la Virgen María en su Inmaculada Concepción. Esta novena se reza tradicionalmente del 29 de noviembre al 7 de diciembre.',
    imagePath: 'assets/images/inmaculada.jpg',
    category: 'mariana',
    startDate: DateTime(2024, 11, 29),
    days: const [
      NovenaDay(
        dayNumber: 1,
        title: 'Día Primero - La Inmaculada Concepción',
        prayer:
            'Oh María, Madre de Dios, concebida sin pecado original, te adoro y te amo con todo mi corazón. Te pido que intercedas por mí ante tu Hijo Jesucristo para que me conceda la gracia de vivir siempre en tu amor y en el de tu Hijo.\n\nOh Virgen Inmaculada, que desde el primer instante de tu concepción fuiste preservada de toda mancha de pecado original, y que por la gracia de Dios y los méritos de Jesucristo, tu Hijo, fuiste adornada con todas las virtudes, te suplico que me ayudes a imitar tu pureza y santidad.\n\nEnséñame a amar a Dios sobre todas las cosas y a mi prójimo como a mí mismo. Ayúdame a vivir cada día con la misma fe, esperanza y caridad que tú tuviste. Que tu ejemplo de humildad, obediencia y pureza sea mi guía en el camino de la santidad.\n\nAmén.',
        intention: 'Por la pureza de corazón y la gracia de Dios',
        reflection:
            'María fue preservada del pecado original desde el primer momento de su concepción. Esta gracia especial la preparó para ser la Madre de Dios. Su pureza perfecta nos muestra el camino hacia la santidad.',
      ),
      NovenaDay(
        dayNumber: 2,
        title: 'Día Segundo - La Gracia de María',
        prayer:
            'Virgen Inmaculada, llena de gracia, ruega por nosotros pecadores. Que tu pureza nos inspire a vivir en santidad y que tu intercesión nos ayude a alcanzar la gracia de Dios.\n\nOh María, que fuiste llena de gracia desde el primer instante de tu concepción, te pido que me ayudes a crecer en la gracia divina cada día. Que tu ejemplo de docilidad al Espíritu Santo me enseñe a responder siempre "sí" a la voluntad de Dios.\n\nAyúdame a ser un instrumento de la gracia de Dios para los demás, especialmente para aquellos que más necesitan de la misericordia divina. Que tu corazón maternal interceda por todos los pecadores y los conduzca al camino de la conversión y la santidad.\n\nEnséñame a vivir cada momento con la misma disponibilidad que tú tuviste cuando el ángel te anunció que serías la Madre de Dios. Que tu "hágase en mí según tu palabra" sea también mi respuesta a Dios.\n\nAmén.',
        intention: 'Por la conversión de los pecadores',
        reflection:
            'María, llena de gracia, es modelo de santidad para todos los cristianos. Su docilidad al Espíritu Santo nos muestra cómo responder a la gracia de Dios.',
      ),
      NovenaDay(
        dayNumber: 3,
        title: 'Día Tercero - María, Madre de Dios',
        prayer:
            'Oh María, Madre de Dios y Madre nuestra, que has sido elevada a la dignidad de Madre del Creador, ruega por nosotros y por todas las madres del mundo.\n\nOh Virgen Santísima, que por tu "sí" generoso te convertiste en la Madre de Dios, te pido que me ayudes a comprender la grandeza de tu maternidad divina. Que tu ejemplo de amor maternal me enseñe a amar a Dios con todo mi corazón, alma y mente.\n\nAyúdame a ser un hijo fiel de Dios y tuyo, siguiendo siempre el camino que tu Hijo Jesucristo me ha trazado. Que tu intercesión maternal me obtenga las gracias necesarias para vivir como un verdadero cristiano.\n\nProtege a todas las madres del mundo, especialmente a aquellas que sufren o están en dificultades. Que tu corazón de madre las consuele y las ayude a cumplir su misión con amor y dedicación.\n\nEnséñame a acudir siempre a ti como mi madre celestial, sabiendo que tu amor maternal nunca me abandonará.\n\nAmén.',
        intention: 'Por todas las madres del mundo',
        reflection:
            'María es verdaderamente la Madre de Dios, no solo por ser madre de Jesús, sino porque Jesús es Dios. Su maternidad divina nos hace a todos hijos de Dios.',
      ),
      NovenaDay(
        dayNumber: 4,
        title: 'Día Cuarto - María, Virgen Purísima',
        prayer:
            'Virgen Purísima, que has conservado tu virginidad antes, durante y después del parto, enséñame a amar la pureza y a vivir con castidad en todos los momentos de mi vida.\n\nOh María, modelo de pureza y virginidad, te pido que me ayudes a mantener mi corazón puro y limpio de todo pecado. Que tu ejemplo de pureza me inspire a vivir una vida santa y virtuosa.\n\nAyúdame a ser un ejemplo de pureza para los jóvenes, especialmente en estos tiempos donde la pureza es tan atacada. Que tu intercesión me obtenga la gracia de vivir siempre con pureza de corazón, mente y cuerpo.\n\nEnséñame a amar la virtud de la castidad como tú la amaste, y a ofrecer mi pureza como un don precioso a Dios. Que tu virginidad perpetua sea mi modelo y mi inspiración.\n\nAmén.',
        intention: 'Por la pureza de los jóvenes',
        reflection:
            'María mantuvo su virginidad perpetua, siendo ejemplo de pureza y castidad. Su pureza perfecta nos muestra el camino hacia la santidad.',
      ),
      NovenaDay(
        dayNumber: 5,
        title: 'Día Quinto - María, Reina de los Ángeles',
        prayer:
            'Oh María, Reina de los Ángeles y de todos los Santos, intercede por mí ante el trono de Dios y obtén para mí la protección de los ángeles.\n\nOh Virgen Santísima, que eres venerada por los ángeles como su reina, te pido que me ayudes a vivir siempre en la presencia de Dios, como los ángeles lo hacen en el cielo. Que tu intercesión me obtenga la gracia de ser fiel a Dios en todo momento.\n\nAyúdame a imitar la adoración y el amor que los ángeles tienen hacia Dios. Que tu ejemplo de humildad y obediencia me enseñe a servir a Dios con la misma dedicación que los ángeles.\n\nProtege a todos los ángeles custodios y ayúdame a escuchar siempre su voz que me guía hacia el bien. Que tu reinado sobre los ángeles me inspire a vivir como un verdadero hijo de Dios.\n\nAmén.',
        intention: 'Por la protección de los ángeles',
        reflection:
            'María es venerada como Reina de los Ángeles, siendo la criatura más perfecta después de Cristo. Su reinado celestial nos muestra su grandeza.',
      ),
      NovenaDay(
        dayNumber: 6,
        title: 'Día Sexto - María, Madre de la Iglesia',
        prayer:
            'Madre de la Iglesia, que velas maternalmente por todos los fieles, protege a tu Iglesia y a todos sus miembros, especialmente en estos tiempos difíciles.\n\nOh María, Madre de la Iglesia, te pido que veles maternalmente por todos los bautizados y nos ayudes a vivir como verdaderos hijos de la Iglesia. Que tu intercesión nos obtenga la gracia de ser fieles a la doctrina de Cristo.\n\nAyúdame a amar a la Iglesia como tú la amas, y a trabajar por su unidad y santificación. Que tu ejemplo de fe y obediencia me enseñe a ser un miembro activo y comprometido de la Iglesia.\n\nProtege especialmente a los sacerdotes, religiosos y religiosas, y a todos aquellos que trabajan por la evangelización. Que tu corazón maternal los sostenga en su misión.\n\nEnséñame a ser un instrumento de unidad en la Iglesia, trabajando siempre por la paz y la concordia entre todos los fieles.\n\nAmén.',
        intention: 'Por la unidad de la Iglesia',
        reflection:
            'María es la Madre de la Iglesia, cuidando de todos los bautizados como hijos suyos. Su maternidad espiritual nos une a todos en Cristo.',
      ),
      NovenaDay(
        dayNumber: 7,
        title: 'Día Séptimo - María, Estrella de la Mañana',
        prayer:
            'Estrella de la Mañana, que iluminas el camino hacia Cristo, guíame en mi peregrinación terrenal y ayúdame a llegar al puerto seguro de la salvación.\n\nOh María, Estrella de la Mañana, que anuncias la llegada del Sol de Justicia, Jesucristo, te pido que ilumines mi camino en esta vida y me ayudes a encontrar siempre la luz de Cristo.\n\nAyúdame a ser también una estrella que ilumine el camino de otros hacia Dios. Que tu ejemplo de fe y esperanza me inspire a ser un testigo de la luz de Cristo en el mundo.\n\nEn los momentos de oscuridad y dificultad, que tu luz maternal me guíe hacia la luz de tu Hijo. Que tu intercesión me ayude a superar todas las tinieblas del pecado y del error.\n\nEnséñame a vivir siempre orientado hacia Cristo, como tú lo estuviste toda tu vida, siendo fiel reflejo de su luz y su amor.\n\nAmén.',
        intention: 'Por la luz de la fe',
        reflection:
            'María es llamada Estrella de la Mañana porque anuncia la llegada del Sol de Justicia, Jesucristo. Su luz nos guía hacia la salvación.',
      ),
      NovenaDay(
        dayNumber: 8,
        title: 'Día Octavo - María, Refugio de los Pecadores',
        prayer:
            'Refugio de los pecadores, acógeme en tu corazón maternal y preséntame a tu Hijo misericordioso para que me perdone y me salve.\n\nOh María, Refugio de los pecadores, te pido que me acojas en tu corazón maternal y me ayudes a encontrar la misericordia de tu Hijo Jesucristo. Que tu intercesión me obtenga el perdón de mis pecados.\n\nAyúdame a confiar siempre en la misericordia de Dios, sabiendo que tu Hijo vino a salvar a los pecadores. Que tu ejemplo de compasión me enseñe a ser misericordioso con los demás.\n\nProtege a todos los pecadores y ayúdales a encontrar el camino de la conversión y la reconciliación. Que tu corazón maternal los conduzca hacia el amor misericordioso de Dios.\n\nEnséñame a acudir siempre a ti como mi refugio seguro, especialmente en los momentos de tentación y pecado.\n\nAmén.',
        intention: 'Por la misericordia de Dios',
        reflection:
            'María es el refugio seguro para todos los pecadores que buscan la misericordia de Dios. Su corazón maternal nos acoge siempre.',
      ),
      NovenaDay(
        dayNumber: 9,
        title: 'Día Noveno - María, Auxilio de los Cristianos',
        prayer:
            'Auxilio de los cristianos, socórreme en mis necesidades y ayúdame a perseverar en la fe hasta el final de mi vida.\n\nOh María, Auxilio de los Cristianos, te pido que me ayudes en todas mis necesidades espirituales y temporales. Que tu intercesión me obtenga las gracias necesarias para perseverar en la fe hasta el final.\n\nAyúdame a ser un cristiano fiel y comprometido, que da testimonio de su fe en todos los momentos de la vida. Que tu ejemplo de fidelidad me inspire a ser siempre fiel a Dios y a la Iglesia.\n\nProtege a todos los cristianos, especialmente a aquellos que sufren persecución por su fe. Que tu auxilio maternal los sostenga en su testimonio de Cristo.\n\nEnséñame a acudir siempre a ti como mi auxilio seguro, sabiendo que nunca me abandonarás en mis necesidades.\n\nAmén.',
        intention: 'Por la perseverancia final',
        reflection:
            'María es nuestro auxilio constante, especialmente en los momentos de dificultad y tentación. Su ayuda maternal nos sostiene siempre.',
      ),
    ],
  );

  // Novena a San José
  static const Novena sanJose = Novena(
    id: 'san_jose',
    title: 'Novenas a San José',
    subtitle: 'Patrono de la Iglesia Universal',
    description:
        'Reza durante nueve días a San José, esposo de María y padre adoptivo de Jesús. Patrono de los trabajadores y de la Iglesia Universal.',
    imagePath: 'assets/images/san_jose.jpg',
    category: 'santos',
    days: [
      NovenaDay(
        dayNumber: 1,
        title: 'Día Primero - San José, Esposo de María',
        prayer:
            'Oh glorioso San José, esposo casto de María, te pido que intercedas por mí ante tu Hijo adoptivo Jesucristo para que me conceda la gracia de vivir en santidad y pureza.\n\nOh San José, modelo de esposo fiel y casto, te suplico que me ayudes a imitar tu virtud de la castidad y tu fidelidad en el matrimonio. Que tu ejemplo de amor puro y desinteresado me inspire a amar con el mismo amor que tú tuviste por María.\n\nAyúdame a ser un esposo/esposa fiel y dedicado, que ama a su cónyuge con un amor verdadero y duradero. Que tu intercesión me obtenga la gracia de vivir mi matrimonio como un sacramento santo.\n\nProtege a todas las familias del mundo, especialmente a aquellas que están en crisis o dificultades. Que tu ejemplo de paternidad responsable me ayude a ser un buen padre/madre para mis hijos.\n\nEnséñame a vivir la virtud de la castidad como tú la viviste, siendo un ejemplo de pureza y santidad para todos los que me rodean.\n\nAmén.',
        intention: 'Por las familias y los matrimonios',
        reflection:
            'San José fue el esposo fiel de María y el padre adoptivo de Jesús, protegiendo a la Sagrada Familia. Su ejemplo de castidad y fidelidad es modelo para todos los matrimonios.',
      ),
      NovenaDay(
        dayNumber: 2,
        title: 'Día Segundo - San José, Patrono de los Trabajadores',
        prayer:
            'San José, modelo de trabajador y patrono de todos los que trabajan, enséñame a trabajar con dedicación, honestidad y amor como lo hiciste tú en tu taller de carpintero.\n\nOh San José, que trabajaste con tus propias manos para mantener a la Sagrada Familia, te pido que me ayudes a ver mi trabajo como una forma de servir a Dios y a los demás. Que tu ejemplo de laboriosidad me inspire a trabajar siempre con excelencia y responsabilidad.\n\nAyúdame a ofrecer mi trabajo diario como una oración, dedicándolo a Dios y haciéndolo por amor a mi familia. Que tu intercesión me obtenga la gracia de encontrar dignidad y sentido en cualquier trabajo que realice.\n\nProtege a todos los trabajadores del mundo, especialmente a aquellos que están desempleados o en condiciones laborales difíciles. Que tu ejemplo de trabajo honesto y perseverante les dé esperanza y fortaleza.\n\nEnséñame a trabajar no solo por el salario, sino por el bien común y la gloria de Dios, como tú lo hiciste toda tu vida.\n\nAmén.',
        intention: 'Por todos los trabajadores',
        reflection:
            'San José trabajó como carpintero para mantener a su familia, siendo ejemplo de laboriosidad. Su trabajo honesto y dedicado es modelo para todos los trabajadores.',
      ),
      NovenaDay(
        dayNumber: 3,
        title: 'Día Tercero - San José, Padre Adoptivo de Jesús',
        prayer:
            'San José, padre adoptivo de Jesús, enséñame a amar y proteger a los niños como lo hiciste con el Niño Dios, cuidándolo con ternura y dedicación.\n\nOh San José, que cuidaste de Jesús como tu propio hijo, enseñándole el oficio de carpintero y educándolo en la fe, te pido que me ayudes a ser un buen padre/madre para mis hijos. Que tu ejemplo de paternidad responsable me inspire a dedicar tiempo y amor a la educación de mis hijos.\n\nAyúdame a proteger a todos los niños del mundo, especialmente a aquellos que están en peligro o sufren abandono. Que tu intercesión me obtenga la gracia de ser un defensor de la vida y la inocencia de los niños.\n\nProtege a todos los niños huérfanos, abandonados o en situaciones difíciles. Que tu corazón paternal se compadezca de ellos y les ayude a encontrar el amor y la protección que necesitan.\n\nEnséñame a ver en cada niño un don precioso de Dios, como tú viste en Jesús, y a tratarlos siempre con respeto, amor y dedicación.\n\nAmén.',
        intention: 'Por todos los niños del mundo',
        reflection:
            'San José cuidó de Jesús como su propio hijo, enseñándole el oficio de carpintero. Su paternidad amorosa es modelo para todos los padres.',
      ),
      NovenaDay(
        dayNumber: 4,
        title: 'Día Cuarto - San José, Protector de la Sagrada Familia',
        prayer:
            'Protector de la Sagrada Familia, cuida también de mi familia y ayúdame a ser un buen protector y guía para los míos, como tú lo fuiste para María y Jesús.\n\nOh San José, que protegiste a María y Jesús del peligro, llevándolos a Egipto cuando Herodes quería matar al Niño, te pido que protejas a mi familia de todos los peligros espirituales y materiales. Que tu ejemplo de valentía y decisión me inspire a defender siempre a los míos.\n\nAyúdame a ser un guardián vigilante de mi familia, protegiéndola de las influencias negativas del mundo y guiándola siempre hacia Dios. Que tu intercesión me obtenga la gracia de ser un líder espiritual en mi hogar.\n\nProtege a todas las familias del mundo, especialmente a aquellas que están amenazadas por la violencia, la pobreza o la división. Que tu ejemplo de protección amorosa les dé esperanza y fortaleza.\n\nEnséñame a sacrificarme por mi familia como tú te sacrificaste, poniendo siempre su bienestar por encima de mis propios intereses.\n\nAmén.',
        intention: 'Por la protección de las familias',
        reflection:
            'San José protegió a María y Jesús del peligro, llevándolos a Egipto cuando Herodes quería matar al Niño. Su protección valiente es modelo para todos los padres.',
      ),
      NovenaDay(
        dayNumber: 5,
        title: 'Día Quinto - San José, Hombre Justo',
        prayer:
            'San José, hombre justo y temeroso de Dios, enséñame a vivir con rectitud y justicia en todos los momentos de mi vida, como tú lo hiciste.\n\nOh San José, que fuiste llamado "hombre justo" por el evangelista Mateo, te pido que me ayudes a vivir siempre según la voluntad de Dios, siendo justo en mis pensamientos, palabras y acciones. Que tu ejemplo de rectitud me inspire a buscar siempre la verdad y la justicia.\n\nAyúdame a ser un testigo de la justicia de Dios en el mundo, defendiendo a los débiles y oprimidos. Que tu intercesión me obtenga la gracia de ser un instrumento de paz y reconciliación.\n\nProtege a todos aquellos que trabajan por la justicia en el mundo, especialmente a los que defienden los derechos de los pobres y marginados. Que tu ejemplo de justicia les dé valor y perseverancia.\n\nEnséñame a vivir la justicia no solo como una virtud social, sino como una forma de amar a Dios y al prójimo, como tú lo hiciste toda tu vida.\n\nAmén.',
        intention: 'Por la justicia en el mundo',
        reflection:
            'San José era un hombre justo que siempre actuó según la voluntad de Dios. Su rectitud y justicia son modelo para todos los cristianos.',
      ),
      NovenaDay(
        dayNumber: 6,
        title: 'Día Sexto - San José, Patrono de la Buena Muerte',
        prayer:
            'Patrono de la buena muerte, que moriste en los brazos de Jesús y María, ruega por mí para que pueda tener una muerte santa y ser recibido en el cielo.\n\nOh San José, que tuviste la dicha de morir en los brazos de Jesús y María, te pido que me ayudes a prepararme para el momento de mi muerte, viviendo cada día como si fuera el último. Que tu ejemplo de confianza en Dios me inspire a enfrentar la muerte sin temor.\n\nAyúdame a vivir una vida santa que me prepare para una muerte santa, acumulando méritos para el cielo. Que tu intercesión me obtenga la gracia de morir en gracia de Dios y ser recibido en el paraíso.\n\nProtege a todos los moribundos, especialmente a aquellos que están solos o sin consuelo espiritual. Que tu presencia les dé paz y esperanza en el momento de su muerte.\n\nEnséñame a recordar siempre que la muerte no es el final, sino el comienzo de la vida eterna, como tú lo experimentaste al morir en los brazos de tu Hijo divino.\n\nAmén.',
        intention: 'Por una santa muerte',
        reflection:
            'San José murió en los brazos de Jesús y María, siendo ejemplo de una muerte santa. Su confianza en Dios es modelo para todos los moribundos.',
      ),
      NovenaDay(
        dayNumber: 7,
        title: 'Día Séptimo - San José, Patrono de la Iglesia',
        prayer:
            'Patrono de la Iglesia Universal, protege a la Iglesia y a todos sus miembros de los peligros que la amenazan, como protegiste a la Sagrada Familia.\n\nOh San José, que eres el patrono de la Iglesia Universal, te pido que protejas a la Iglesia de todos los ataques y persecuciones que sufre en el mundo. Que tu ejemplo de fidelidad a Dios me inspire a ser siempre fiel a la Iglesia y a sus enseñanzas.\n\nAyúdame a amar a la Iglesia como tú la amas, trabajando por su unidad y santificación. Que tu intercesión me obtenga la gracia de ser un miembro activo y comprometido de la Iglesia.\n\nProtege especialmente a los sacerdotes, religiosos y religiosas, y a todos aquellos que trabajan por la evangelización. Que tu ejemplo de servicio silencioso les inspire en su misión.\n\nEnséñame a defender siempre la verdad de la Iglesia, siendo un testigo valiente de la fe, como tú defendiste siempre la verdad de Dios.\n\nAmén.',
        intention: 'Por la protección de la Iglesia',
        reflection:
            'San José es el patrono de la Iglesia Universal, protegiéndola como protegió a la Sagrada Familia. Su fidelidad es modelo para todos los fieles.',
      ),
      NovenaDay(
        dayNumber: 8,
        title: 'Día Octavo - San José, Modelo de Silencio',
        prayer:
            'Modelo de silencio y humildad, enséñame a escuchar la voz de Dios en el silencio de mi corazón y a responder a su voluntad con docilidad, como tú lo hiciste.\n\nOh San José, que no pronunciaste una sola palabra en los Evangelios, pero cuya vida habla de obediencia y humildad, te pido que me ayudes a cultivar el silencio interior para poder escuchar la voz de Dios. Que tu ejemplo de docilidad me inspire a responder siempre "sí" a la voluntad de Dios.\n\nAyúdame a valorar el silencio como un medio para encontrarme con Dios y escuchar su voz en mi corazón. Que tu intercesión me obtenga la gracia de ser más contemplativo y menos hablador.\n\nProtege a todos aquellos que buscan el silencio para orar y meditar, especialmente a los monjes y monjas contemplativos. Que tu ejemplo de vida silenciosa les inspire en su vocación.\n\nEnséñame a hablar solo cuando sea necesario y a escuchar siempre con atención, como tú escuchaste siempre la voz de Dios en tu corazón.\n\nAmén.',
        intention: 'Por el don del silencio',
        reflection:
            'San José no pronunció palabra en los Evangelios, pero su vida habla de obediencia y humildad. Su silencio elocuente es modelo para todos los cristianos.',
      ),
      NovenaDay(
        dayNumber: 9,
        title: 'Día Noveno - San José, Intercesor Poderoso',
        prayer:
            'Intercesor poderoso, que tienes gran poder ante Dios por ser el padre adoptivo de Jesús, obtén para mí las gracias que necesito para mi salvación y la de mi familia.\n\nOh San José, que tienes un poder especial de intercesión ante Dios por tu relación única con Jesús y María, te pido que intercedas por mí ante el trono de Dios para que me conceda todas las gracias que necesito. Que tu ejemplo de confianza en Dios me inspire a confiar siempre en su providencia.\n\nAyúdame a acudir siempre a ti como mi intercesor poderoso, sabiendo que tu oración es muy eficaz ante Dios. Que tu intercesión me obtenga la gracia de vivir una vida santa y llegar al cielo.\n\nProtege a todos aquellos que te invocan como su intercesor, especialmente a los que están en situaciones difíciles o desesperadas. Que tu poder de intercesión les dé esperanza y consuelo.\n\nEnséñame a confiar siempre en tu intercesión maternal, sabiendo que nunca me abandonarás y que siempre escucharás mis súplicas.\n\nAmén.',
        intention: 'Por todas las necesidades espirituales',
        reflection:
            'San José tiene un poder especial de intercesión ante Dios por ser el padre adoptivo de Jesús. Su intercesión poderosa nos ayuda siempre.',
      ),
    ],
  );

  // Novena a la Virgen de Guadalupe
  static const Novena virgenGuadalupe = Novena(
    id: 'virgen_guadalupe',
    title: 'Novenas de la Virgen de Guadalupe',
    subtitle: 'Emperatriz de las Américas',
    description:
        'Reza durante nueve días a la Virgen de Guadalupe, patrona de las Américas. Esta devoción es especialmente popular en México y Latinoamérica.',
    imagePath: 'assets/images/guadalupe.jpg',
    category: 'mariana',
    days: [
      NovenaDay(
        dayNumber: 1,
        title: 'Día Primero - La Aparición a Juan Diego',
        prayer:
            'Oh Virgen de Guadalupe, que te apareciste a Juan Diego en el Tepeyac el 9 de diciembre de 1531, ruega por nosotros y por toda la humanidad, especialmente por la unidad de las Américas.\n\nOh Madre Santísima, que elegiste aparecerte a un humilde indígena para mostrar tu amor por todos los pueblos, te pido que me ayudes a ver en cada persona, sin importar su raza o condición social, un hijo amado de Dios. Que tu ejemplo de amor universal me inspire a tratar a todos con respeto y dignidad.\n\nAyúdame a ser un instrumento de unidad y reconciliación entre todos los pueblos, especialmente entre los diferentes países de las Américas. Que tu intercesión me obtenga la gracia de trabajar por la paz y la fraternidad entre todas las naciones.\n\nProtege a todos los pueblos indígenas del mundo, especialmente a aquellos que sufren discriminación o marginación. Que tu aparición a Juan Diego les dé esperanza y les recuerde que son amados por Dios.\n\nEnséñame a acudir siempre a ti como mi madre celestial, sabiendo que me amas con el mismo amor maternal que tuviste por Juan Diego.\n\nAmén.',
        intention: 'Por la unidad de las Américas',
        reflection:
            'La Virgen se apareció a Juan Diego en 1531, marcando el inicio de la evangelización de las Américas. Su amor por los indígenas muestra su corazón universal.',
      ),
      NovenaDay(
        dayNumber: 2,
        title: 'Día Segundo - La Madre de los Indios',
        prayer:
            'Madre de los indios y de todos los pobres, que te presentaste como una de ellos, acoge a todos los marginados y ayúdame a ser un instrumento de tu amor para ellos.\n\nOh Virgen de Guadalupe, que elegiste aparecerte con rasgos indígenas para mostrar que amas a todos por igual, sin distinción de raza o condición social, te pido que me ayudes a ver en cada persona, especialmente en los pobres y marginados, un hijo amado de Dios. Que tu ejemplo de amor universal me inspire a servir a los más necesitados.\n\nAyúdame a ser un defensor de los derechos de los pobres y marginados, trabajando por la justicia social y la dignidad humana. Que tu intercesión me obtenga la gracia de ser generoso con los necesitados y de luchar contra la pobreza y la injusticia.\n\nProtege a todos los pobres del mundo, especialmente a aquellos que viven en condiciones inhumanas. Que tu corazón maternal se compadezca de ellos y les ayude a encontrar la esperanza y la dignidad que merecen.\n\nEnséñame a amar a los pobres como tú los amas, viendo en ellos el rostro de tu Hijo Jesucristo.\n\nAmén.',
        intention: 'Por los pobres y marginados',
        reflection:
            'La Virgen se presentó con rasgos indígenas para mostrar que ama a todos por igual. Su amor por los pobres es ejemplo para todos los cristianos.',
      ),
      NovenaDay(
        dayNumber: 3,
        title: 'Día Tercero - La Imagen Milagrosa',
        prayer:
            'Oh Virgen, cuya imagen quedó impresa milagrosamente en la tilma de Juan Diego, aumenta mi fe en ti y ayúdame a ser un testigo de tu amor y poder.\n\nOh Madre Santísima, que dejaste tu imagen impresa en la tilma de Juan Diego como prueba irrefutable de tu aparición, te pido que aumentes mi fe en ti y me ayudes a confiar siempre en tu intercesión. Que tu imagen milagrosa me recuerde que eres real y que me amas personalmente.\n\nAyúdame a ser un testigo de tu amor y poder en el mundo, compartiendo con otros la historia de tu aparición y el mensaje de amor que trajiste. Que tu intercesión me obtenga la gracia de ser un evangelizador valiente y fiel.\n\nProtege a todos aquellos que dudan de tu existencia o de tu amor, especialmente a los que han perdido la fe. Que tu imagen milagrosa les ayude a encontrar el camino de regreso a Dios.\n\nEnséñame a venerar tu imagen con respeto y amor, sabiendo que a través de ella me bendices y me proteges.\n\nAmén.',
        intention: 'Por el aumento de la fe',
        reflection:
            'La imagen de la Virgen quedó impresa en la tilma de Juan Diego como prueba de su aparición. Este milagro fortalece nuestra fe en su intercesión.',
      ),
      NovenaDay(
        dayNumber: 4,
        title: 'Día Cuarto - La Emperatriz de las Américas',
        prayer:
            'Emperatriz de las Américas, protege a todos los pueblos de este continente y ayúdales a vivir en paz, unidad y fraternidad.\n\nOh Virgen de Guadalupe, Emperatriz de las Américas, te pido que protejas a todos los pueblos de este continente y les ayudes a vivir en paz y armonía. Que tu reinado maternal se extienda por toda América, uniendo a todos los pueblos en el amor de Cristo.\n\nAyúdame a trabajar por la paz en las Américas, siendo un instrumento de reconciliación y unidad entre todos los países. Que tu intercesión me obtenga la gracia de ser un promotor de la fraternidad y la solidaridad entre las naciones.\n\nProtege especialmente a los países que sufren violencia, pobreza o división. Que tu corazón maternal los consuele y les ayude a encontrar el camino de la paz y la prosperidad.\n\nEnséñame a amar a todas las naciones de las Américas como tú las amas, trabajando por su bienestar espiritual y material.\n\nAmén.',
        intention: 'Por la paz en las Américas',
        reflection:
            'La Virgen de Guadalupe es reconocida como la Emperatriz de las Américas. Su reinado maternal une a todos los pueblos del continente.',
      ),
      NovenaDay(
        dayNumber: 5,
        title: 'Día Quinto - La Madre de la Vida',
        prayer:
            'Madre de la Vida, que llevas en tu vientre al Niño Jesús, protege a todos los niños por nacer y ayúdame a defender la vida desde su concepción hasta su muerte natural.\n\nOh Virgen de Guadalupe, que apareces embarazada en tu imagen milagrosa, mostrando que eres la Madre de la Vida, te pido que me ayudes a defender la vida humana desde el momento de la concepción hasta la muerte natural. Que tu ejemplo de amor por la vida me inspire a ser un defensor valiente de todos los seres humanos.\n\nAyúdame a trabajar por la protección de los niños por nacer, especialmente de aquellos que están en peligro de ser abortados. Que tu intercesión me obtenga la gracia de ser un testigo valiente de la santidad de la vida humana.\n\nProtege a todas las madres embarazadas, especialmente a aquellas que están en situaciones difíciles. Que tu corazón maternal las consuele y les ayude a elegir la vida para sus hijos.\n\nEnséñame a ver en cada persona, desde el momento de su concepción, un don precioso de Dios, como tú viste en Jesús.\n\nAmén.',
        intention: 'Por la defensa de la vida',
        reflection:
            'La Virgen aparece embarazada, mostrando que es la Madre de la Vida. Su protección maternal se extiende a todos los seres humanos.',
      ),
      NovenaDay(
        dayNumber: 6,
        title: 'Día Sexto - La Consoladora de los Afligidos',
        prayer:
            'Consoladora de los afligidos, seca mis lágrimas y dame consuelo en mis penas, y ayúdame a consolar a otros que sufren.\n\nOh Virgen de Guadalupe, Consoladora de los afligidos, te pido que seques mis lágrimas y me des consuelo en mis penas, sabiendo que tu corazón maternal siempre me acoge. Que tu ejemplo de compasión me inspire a consolar a otros que sufren.\n\nAyúdame a ser un instrumento de tu consuelo para todos aquellos que están afligidos, especialmente para los que han perdido seres queridos o están pasando por momentos difíciles. Que tu intercesión me obtenga la gracia de ser un consuelo para los demás.\n\nProtege a todos los afligidos del mundo, especialmente a aquellos que están solos o sin consuelo. Que tu corazón maternal se compadezca de ellos y les ayude a encontrar la paz y la esperanza.\n\nEnséñame a acudir siempre a ti en mis momentos de dolor, sabiendo que tu consuelo maternal nunca me fallará.\n\nAmén.',
        intention: 'Por el consuelo de los afligidos',
        reflection:
            'La Virgen de Guadalupe consuela a todos los que sufren y están afligidos. Su corazón maternal nos acoge siempre en nuestros dolores.',
      ),
      NovenaDay(
        dayNumber: 7,
        title: 'Día Séptimo - La Madre de la Esperanza',
        prayer:
            'Madre de la Esperanza, que traes esperanza a los desesperados, infunde en mi corazón la esperanza y ayúdame a ser un portador de esperanza para otros.\n\nOh Virgen de Guadalupe, Madre de la Esperanza, te pido que infundas en mi corazón la esperanza que solo tú puedes dar, especialmente en los momentos de desesperación y oscuridad. Que tu ejemplo de fe y confianza en Dios me inspire a mantener siempre viva la esperanza.\n\nAyúdame a ser un portador de esperanza para todos aquellos que han perdido la fe en Dios o en la humanidad. Que tu intercesión me obtenga la gracia de ser un testigo de la esperanza cristiana en el mundo.\n\nProtege a todos los desesperados del mundo, especialmente a aquellos que han perdido el sentido de la vida. Que tu corazón maternal les ayude a encontrar la luz de la esperanza en medio de la oscuridad.\n\nEnséñame a confiar siempre en la providencia de Dios, como tú confiaste, sabiendo que Él nunca nos abandona.\n\nAmén.',
        intention: 'Por la esperanza en el mundo',
        reflection:
            'La Virgen trae esperanza a todos los que la invocan con fe. Su confianza en Dios es modelo para todos los cristianos.',
      ),
      NovenaDay(
        dayNumber: 8,
        title: 'Día Octavo - La Protectora de las Familias',
        prayer:
            'Protectora de las familias, cuida de mi familia y ayúdame a vivir en unidad y amor, como la Sagrada Familia.\n\nOh Virgen de Guadalupe, Protectora de las Familias, te pido que cuides de mi familia y me ayudes a vivir en unidad y amor, siguiendo el ejemplo de la Sagrada Familia. Que tu protección maternal nos mantenga unidos en el amor de Cristo.\n\nAyúdame a ser un buen padre/madre para mis hijos, educándolos en la fe y en los valores cristianos. Que tu intercesión me obtenga la gracia de crear un hogar donde reine el amor, la paz y la fe.\n\nProtege a todas las familias del mundo, especialmente a aquellas que están en crisis o amenazadas por la división. Que tu corazón maternal las consuele y les ayude a superar sus dificultades.\n\nEnséñame a valorar la familia como el don más precioso que Dios me ha dado, y a trabajar siempre por su unidad y santificación.\n\nAmén.',
        intention: 'Por la unidad de las familias',
        reflection:
            'La Virgen de Guadalupe protege especialmente a las familias cristianas. Su protección maternal nos ayuda a vivir en unidad y amor.',
      ),
      NovenaDay(
        dayNumber: 9,
        title: 'Día Noveno - La Reina de México',
        prayer:
            'Reina de México y de toda América, que tu reinado se extienda por todo el mundo y que todos los pueblos te reconozcan como su madre y reina.\n\nOh Virgen de Guadalupe, Reina de México y de toda América, te pido que tu reinado se extienda por todo el mundo, llevando el mensaje de amor y esperanza que trajiste a Juan Diego. Que todos los pueblos te reconozcan como su madre y reina.\n\nAyúdame a ser un instrumento de tu reinado en el mundo, evangelizando con mi vida y mis palabras el amor de Cristo. Que tu intercesión me obtenga la gracia de ser un testigo valiente de la fe en todos los lugares donde me encuentre.\n\nProtege especialmente a México y a todos los países de las Américas, ayudándoles a ser fieles a la fe cristiana y a vivir según los valores del Evangelio. Que tu reinado maternal los guíe hacia la paz y la prosperidad.\n\nEnséñame a ser un súbdito fiel de tu reinado, sirviendo siempre a Dios y al prójimo con amor y dedicación.\n\nAmén.',
        intention: 'Por la evangelización del mundo',
        reflection:
            'La Virgen de Guadalupe es la Reina de México y de toda América. Su reinado maternal se extiende por todo el mundo.',
      ),
    ],
  );

  // Novena de la Divina Misericordia
  static const Novena divinaMisericordia = Novena(
    id: 'divina_misericordia',
    title: 'Novenas de la Divina Misericordia',
    subtitle: 'Jesús, en ti confío',
    description:
        'Reza durante nueve días la novena de la Divina Misericordia, revelada a Santa Faustina Kowalska. Se reza tradicionalmente desde el Viernes Santo hasta el domingo de la Divina Misericordia.',
    imagePath: 'assets/images/divina_misericordia.jpg',
    category: 'jesus',
    days: [
      NovenaDay(
        dayNumber: 1,
        title: 'Día Primero - Por toda la humanidad',
        prayer:
            'Hoy tráeme a toda la humanidad, especialmente a todos los pecadores, y sumérgelos en el océano de mi misericordia. Que mi Sangre amarga, que se derramó por ellos, les sirva de refrigerio.\n\nOh Jesús, que por tu infinita misericordia quieres salvar a toda la humanidad, te pido que tengas piedad de todos los pecadores del mundo, especialmente de aquellos que están más alejados de tu amor. Que tu Sangre preciosa, derramada en la cruz, los purifique y los conduzca de regreso a tu corazón misericordioso.\n\nAyúdame a ser un instrumento de tu misericordia para todos los que me rodean, mostrándoles tu amor y tu perdón. Que mi vida sea un testimonio de tu misericordia infinita.\n\nProtege especialmente a aquellos que han perdido la fe o que nunca han conocido tu amor. Que tu misericordia los alcance y los salve.\n\nEnséñame a confiar siempre en tu misericordia, sabiendo que es más grande que todos los pecados del mundo.\n\nAmén.',
        intention: 'Por toda la humanidad',
        reflection:
            'Jesús pide que recemos por todos los pecadores, especialmente por los más alejados de su amor. Su misericordia es infinita y alcanza a todos.',
      ),
      NovenaDay(
        dayNumber: 2,
        title: 'Día Segundo - Por las almas de los sacerdotes y religiosos',
        prayer:
            'Hoy tráeme las almas de los sacerdotes y religiosos, y sumérgelas en mi misericordia insondable.',
        intention: 'Por los sacerdotes y religiosos',
        reflection:
            'Los sacerdotes y religiosos necesitan especialmente nuestras oraciones para ser fieles a su vocación.',
      ),
      NovenaDay(
        dayNumber: 3,
        title: 'Día Tercero - Por todas las almas devotas y fieles',
        prayer:
            'Hoy tráeme todas las almas devotas y fieles, y sumérgelas en el océano de mi misericordia.',
        intention: 'Por los fieles devotos',
        reflection:
            'Jesús ama especialmente a las almas que son devotas y fieles a su voluntad.',
      ),
      NovenaDay(
        dayNumber: 4,
        title: 'Día Cuarto - Por los paganos y los que aún no me conocen',
        prayer:
            'Hoy tráeme a los paganos y a los que aún no me conocen, y pensé en ellos en mi amarga pasión.',
        intention: 'Por la evangelización',
        reflection:
            'Jesús pensó en todos los que no lo conocen durante su pasión, mostrando su amor universal.',
      ),
      NovenaDay(
        dayNumber: 5,
        title: 'Día Quinto - Por las almas de los herejes y cismáticos',
        prayer:
            'Hoy tráeme las almas de los herejes y cismáticos, y sumérgelas en el océano de mi misericordia.',
        intention: 'Por la unidad de los cristianos',
        reflection:
            'Jesús desea la unidad de todos los cristianos y pide oraciones por quienes están separados.',
      ),
      NovenaDay(
        dayNumber: 6,
        title: 'Día Sexto - Por las almas mansas y humildes',
        prayer:
            'Hoy tráeme las almas mansas y humildes y las almas de los niños pequeños, y sumérgelas en mi misericordia.',
        intention: 'Por los niños y los humildes',
        reflection:
            'Jesús ama especialmente a los niños y a las almas humildes y sencillas.',
      ),
      NovenaDay(
        dayNumber: 7,
        title:
            'Día Séptimo - Por las almas que veneran y glorifican mi misericordia',
        prayer:
            'Hoy tráeme las almas que veneran y glorifican mi misericordia, y sumérgelas en mi misericordia.',
        intention: 'Por los devotos de la Divina Misericordia',
        reflection:
            'Jesús bendice especialmente a quienes veneran y glorifican su misericordia.',
      ),
      NovenaDay(
        dayNumber: 8,
        title:
            'Día Octavo - Por las almas que están en la cárcel del purgatorio',
        prayer:
            'Hoy tráeme las almas que están en la cárcel del purgatorio, y sumérgelas en el abismo de mi misericordia.',
        intention: 'Por las almas del purgatorio',
        reflection:
            'Jesús pide oraciones por las almas del purgatorio para que puedan llegar pronto al cielo.',
      ),
      NovenaDay(
        dayNumber: 9,
        title: 'Día Noveno - Por las almas tibias',
        prayer:
            'Hoy tráeme las almas tibias, y sumérgelas en el abismo de mi misericordia.',
        intention: 'Por las almas tibias',
        reflection:
            'Jesús pide oraciones especiales por las almas tibias que no son ni frías ni calientes en su amor.',
      ),
    ],
  );

  // Novena a San Antonio de Padua
  static const Novena sanAntonio = Novena(
    id: 'san_antonio',
    title: 'Novenas a San Antonio de Padua',
    subtitle: 'Santo de los milagros',
    description:
        'Reza durante nueve días a San Antonio de Padua, conocido como el "Santo de los milagros" y patrono de los objetos perdidos.',
    imagePath: 'assets/images/san_antonio.jpg',
    category: 'santos',
    days: [
      NovenaDay(
        dayNumber: 1,
        title: 'Día Primero - San Antonio, Doctor de la Iglesia',
        prayer:
            'Glorioso San Antonio, doctor de la Iglesia y predicador elocuente, ruega por nosotros para que seamos fieles a la doctrina de Cristo y a las enseñanzas de la Iglesia.\n\nOh San Antonio, que fuiste proclamado Doctor de la Iglesia por tu sabiduría y elocuencia en la predicación, te pido que me ayudes a conocer y amar profundamente la doctrina de Cristo. Que tu ejemplo de estudio y meditación de las Escrituras me inspire a profundizar en mi fe.\n\nAyúdame a ser un defensor valiente de la verdad católica, especialmente en estos tiempos donde la fe es atacada y confundida. Que tu intercesión me obtenga la gracia de proclamar la verdad con valentía y amor.\n\nProtege a todos los teólogos, catequistas y predicadores, ayudándoles a transmitir fielmente la doctrina de la Iglesia. Que tu sabiduría los ilumine en su misión de enseñar la fe.\n\nEnséñame a ser siempre fiel a la doctrina de Cristo, como tú lo fuiste, defendiendo la verdad sin temor a las persecuciones.\n\nAmén.',
        intention: 'Por la fe y la doctrina de la Iglesia',
        reflection:
            'San Antonio fue un gran predicador y doctor de la Iglesia, conocido por su elocuencia. Su sabiduría y fidelidad a la doctrina son modelo para todos los cristianos.',
      ),
      NovenaDay(
        dayNumber: 2,
        title: 'Día Segundo - San Antonio, Patrono de los Objetos Perdidos',
        prayer:
            'San Antonio, patrono de los objetos perdidos, ayúdame a encontrar lo que he perdido y lo que busco, tanto en lo material como en lo espiritual.\n\nOh San Antonio, que tienes un poder especial para encontrar lo perdido, te pido que me ayudes a encontrar no solo los objetos materiales que he perdido, sino también la fe, la esperanza y el amor que a veces se debilitan en mi corazón. Que tu intercesión me ayude a recuperar todo lo que es valioso para mi salvación.\n\nAyúdame a encontrar el camino de regreso a Dios cuando me siento perdido en el pecado o en la confusión. Que tu poder de intercesión me conduzca siempre hacia la luz de Cristo.\n\nProtege a todos aquellos que han perdido la fe o que están buscando el sentido de su vida. Que tu intercesión les ayude a encontrar el tesoro más precioso: el amor de Dios.\n\nEnséñame a confiar siempre en tu poder de intercesión, sabiendo que nunca me abandonarás en mis necesidades.\n\nAmén.',
        intention: 'Por encontrar lo perdido',
        reflection:
            'San Antonio es invocado especialmente para encontrar objetos perdidos y también para encontrar la fe perdida. Su intercesión nos ayuda a recuperar lo valioso.',
      ),
      NovenaDay(
        dayNumber: 3,
        title: 'Día Tercero - San Antonio, Predicador Eloquente',
        prayer:
            'San Antonio, predicador elocuente, enséñame a proclamar la palabra de Dios con valentía, amor y sabiduría, como tú lo hiciste.\n\nOh San Antonio, que eras tan elocuente que hasta los peces te escuchaban predicar, te pido que me ayudes a proclamar la palabra de Dios con el mismo fervor y sabiduría que tú tuviste. Que tu ejemplo de predicación me inspire a ser un testigo valiente de la fe.\n\nAyúdame a prepararme bien para transmitir el mensaje de Cristo, estudiando las Escrituras y meditando en ellas como tú lo hacías. Que tu intercesión me obtenga la gracia de hablar con sabiduría y convicción.\n\nProtege a todos los predicadores y evangelizadores, especialmente a aquellos que están siendo perseguidos por proclamar la verdad. Que tu elocuencia los inspire en su misión.\n\nEnséñame a predicar no solo con palabras, sino también con el ejemplo de mi vida, como tú lo hiciste.\n\nAmén.',
        intention: 'Por los predicadores y evangelizadores',
        reflection:
            'San Antonio era tan elocuente que hasta los peces lo escuchaban predicar. Su predicación transformaba corazones y convertía pecadores.',
      ),
      NovenaDay(
        dayNumber: 4,
        title: 'Día Cuarto - San Antonio, Protector de los Pobres',
        prayer:
            'San Antonio, protector de los pobres, ayúdame a ser generoso con los necesitados como lo fuiste tú, compartiendo todo lo que tengo con amor.\n\nOh San Antonio, que siempre ayudaste a los pobres y necesitados con gran generosidad, te pido que me ayudes a tener el mismo corazón compasivo que tú tuviste. Que tu ejemplo de caridad me inspire a ser generoso con todos los que sufren.\n\nAyúdame a ver en cada pobre el rostro de Cristo, y a servirles con amor y respeto. Que tu intercesión me obtenga la gracia de ser un instrumento de la caridad de Dios en el mundo.\n\nProtege a todos los pobres del mundo, especialmente a aquellos que sufren hambre, frío o abandono. Que tu corazón compasivo se compadezca de ellos y les ayude a encontrar la esperanza.\n\nEnséñame a ser siempre generoso con los necesitados, sabiendo que lo que hago por ellos, lo hago por Cristo.\n\nAmén.',
        intention: 'Por los pobres y necesitados',
        reflection:
            'San Antonio siempre ayudó a los pobres y necesitados con gran generosidad. Su caridad es modelo para todos los cristianos.',
      ),
      NovenaDay(
        dayNumber: 5,
        title: 'Día Quinto - San Antonio, Modelo de Humildad',
        prayer:
            'San Antonio, modelo de humildad, enséñame a ser humilde como lo fuiste tú, sirviendo a los demás sin buscar honores ni reconocimientos.\n\nOh San Antonio, que fuiste muy humilde, siempre dispuesto a servir a los demás sin buscar honores, te pido que me ayudes a cultivar la virtud de la humildad en mi corazón. Que tu ejemplo de servicio desinteresado me inspire a servir a Dios y al prójimo con humildad.\n\nAyúdame a reconocer que todo lo bueno que tengo viene de Dios, y a no buscar la gloria para mí mismo, sino para Dios. Que tu intercesión me obtenga la gracia de ser humilde de corazón.\n\nProtege a todos aquellos que están siendo tentados por el orgullo o la vanidad, ayudándoles a encontrar el camino de la humildad. Que tu ejemplo les inspire a seguir el camino de Cristo.\n\nEnséñame a ser siempre humilde, como tú lo fuiste, sabiendo que la humildad es el camino hacia la santidad.\n\nAmén.',
        intention: 'Por el don de la humildad',
        reflection:
            'San Antonio era muy humilde, siempre dispuesto a servir a los demás sin buscar honores. Su humildad es modelo para todos los cristianos.',
      ),
      NovenaDay(
        dayNumber: 6,
        title: 'Día Sexto - San Antonio, Intercesor Poderoso',
        prayer:
            'San Antonio, intercesor poderoso, que tienes gran poder ante Dios por tu santidad y virtudes, obtén para mí las gracias que necesito para mi salvación.\n\nOh San Antonio, que tienes un poder especial de intercesión ante Dios, te pido que intercedas por mí ante el trono de Dios para que me conceda todas las gracias que necesito. Que tu santidad y virtudes hagan que mi oración sea más eficaz.\n\nAyúdame a confiar siempre en tu poder de intercesión, sabiendo que Dios escucha especialmente las oraciones de los santos. Que tu intercesión me obtenga la gracia de vivir una vida santa y llegar al cielo.\n\nProtege a todos aquellos que te invocan como su intercesor, especialmente a los que están en situaciones difíciles o desesperadas. Que tu poder de intercesión les dé esperanza y consuelo.\n\nEnséñame a acudir siempre a ti como mi intercesor poderoso, sabiendo que nunca me abandonarás.\n\nAmén.',
        intention: 'Por todas las necesidades espirituales',
        reflection:
            'San Antonio tiene un poder especial de intercesión ante Dios por su santidad y virtudes. Su intercesión nos ayuda siempre.',
      ),
      NovenaDay(
        dayNumber: 7,
        title: 'Día Séptimo - San Antonio, Protector de las Familias',
        prayer:
            'San Antonio, protector de las familias, cuida de mi familia y ayúdame a vivir en unidad y amor, como la Sagrada Familia.\n\nOh San Antonio, que proteges especialmente a las familias cristianas, te pido que cuides de mi familia y me ayudes a crear un hogar donde reine el amor, la paz y la fe. Que tu protección nos mantenga unidos en el amor de Cristo.\n\nAyúdame a ser un buen padre/madre para mis hijos, educándolos en la fe y en los valores cristianos. Que tu intercesión me obtenga la gracia de ser un ejemplo de virtud para mi familia.\n\nProtege a todas las familias del mundo, especialmente a aquellas que están en crisis o amenazadas por la división. Que tu protección las ayude a superar sus dificultades.\n\nEnséñame a valorar la familia como el don más precioso que Dios me ha dado, y a trabajar siempre por su unidad y santificación.\n\nAmén.',
        intention: 'Por la unidad de las familias',
        reflection:
            'San Antonio protege especialmente a las familias cristianas y les ayuda a vivir en armonía. Su protección maternal sostiene a todas las familias.',
      ),
      NovenaDay(
        dayNumber: 8,
        title: 'Día Octavo - San Antonio, Patrono de los Viajeros',
        prayer:
            'San Antonio, patrono de los viajeros, protege a todos los que viajan y ayúdame en mi camino de la vida, que es el camino hacia Dios.\n\nOh San Antonio, que eres invocado como protector de los viajeros y peregrinos, te pido que protejas a todos los que viajan, especialmente a aquellos que están en peligro o en situaciones difíciles. Que tu protección los mantenga seguros en sus viajes.\n\nAyúdame a ver mi vida como un peregrinaje hacia Dios, y a caminar siempre por el camino de la virtud y la santidad. Que tu intercesión me guíe en mi peregrinación terrenal.\n\nProtege especialmente a los misioneros y evangelizadores que viajan para llevar el mensaje de Cristo a tierras lejanas. Que tu protección los sostenga en su misión apostólica.\n\nEnséñame a confiar siempre en tu protección en todos mis viajes, tanto físicos como espirituales.\n\nAmén.',
        intention: 'Por la protección en los viajes',
        reflection:
            'San Antonio es invocado como protector de los viajeros y peregrinos. Su protección nos guía en nuestro camino hacia Dios.',
      ),
      NovenaDay(
        dayNumber: 9,
        title: 'Día Noveno - San Antonio, Santo de los Milagros',
        prayer:
            'San Antonio, santo de los milagros, que realizaste tantos milagros en vida, ruega por mí para que alcance las gracias que necesito y pueda experimentar tu poder milagroso.\n\nOh San Antonio, que eres conocido como el "Santo de los milagros" por los numerosos milagros que realizaste durante tu vida, te pido que intercedas por mí ante Dios para que me conceda las gracias que necesito. Que tu poder milagroso se manifieste en mi vida.\n\nAyúdame a confiar en tu poder de intercesión, sabiendo que Dios escucha especialmente las oraciones de los santos. Que tu intercesión me obtenga los milagros que necesito para mi salvación.\n\nProtege a todos aquellos que te invocan para obtener milagros, especialmente a los enfermos, los pobres y los que están en situaciones desesperadas. Que tu poder milagroso les dé esperanza y consuelo.\n\nEnséñame a alabar siempre a Dios por los milagros que realiza a través de tu intercesión, y a ser agradecido por todas sus bendiciones.\n\nAmén.',
        intention: 'Por la intercesión milagrosa',
        reflection:
            'San Antonio es conocido como el "Santo de los milagros" por los numerosos milagros que realizó. Su intercesión milagrosa nos ayuda siempre.',
      ),
    ],
  );

  // Novena a la Virgen de Fátima
  static const Novena virgenFatima = Novena(
    id: 'virgen_fatima',
    title: 'Novenas de la Virgen de Fátima',
    subtitle: 'Reina del Rosario',
    description:
        'Reza durante nueve días a la Virgen de Fátima, que se apareció a tres pastorcitos en Portugal en 1917.',
    imagePath: 'assets/images/fatima.jpg',
    category: 'mariana',
    days: [
      NovenaDay(
        dayNumber: 1,
        title: 'Día Primero - La Primera Aparición',
        prayer:
            'Oh Virgen de Fátima, que te apareciste a los tres pastorcitos el 13 de mayo de 1917, ruega por nosotros y por toda la humanidad, especialmente por la paz del mundo.\n\nOh Madre Santísima, que elegiste aparecerte a tres humildes pastorcitos para transmitir tu mensaje de paz y conversión, te pido que me ayudes a ser un instrumento de tu paz en el mundo. Que tu aparición en Fátima me inspire a trabajar por la paz en mi familia, en mi comunidad y en el mundo entero.\n\nAyúdame a ser un mensajero de tu amor y de tu misericordia, como lo fueron los tres pastorcitos. Que tu intercesión me obtenga la gracia de ser un testigo valiente de la fe en todos los lugares donde me encuentre.\n\nProtege especialmente a todos los niños del mundo, como protegiste a Lucía, Francisco y Jacinta. Que tu corazón maternal se compadezca de todos los niños que sufren.\n\nEnséñame a acudir siempre a ti como mi madre celestial, sabiendo que me amas con el mismo amor que tuviste por los tres pastorcitos.\n\nAmén.',
        intention: 'Por la paz del mundo',
        reflection:
            'La Virgen se apareció en Fátima pidiendo oraciones por la paz y la conversión de los pecadores. Su mensaje de paz es urgente para nuestro tiempo.',
      ),
      NovenaDay(
        dayNumber: 2,
        title: 'Día Segundo - El Mensaje de Paz',
        prayer:
            'Virgen de Fátima, que pediste oraciones por la paz, ayúdame a ser instrumento de paz en el mundo y a trabajar por la reconciliación entre todos los pueblos.\n\nOh Madre Santísima, que en Fátima pediste especialmente oraciones por la paz del mundo, amenazada por la guerra, te pido que me ayudes a ser un instrumento de tu paz en todos los lugares donde me encuentre. Que tu mensaje de paz me inspire a trabajar por la reconciliación y la fraternidad.\n\nAyúdame a ser un constructor de paz en mi familia, en mi trabajo y en mi comunidad, resolviendo los conflictos con amor y comprensión. Que tu intercesión me obtenga la gracia de ser un promotor de la paz en el mundo.\n\nProtege especialmente a todos los países que sufren guerras, violencia o conflictos, ayudándoles a encontrar el camino de la paz y la reconciliación. Que tu corazón maternal los consuele y les ayude a superar sus divisiones.\n\nEnséñame a orar siempre por la paz del mundo, como tú pediste en Fátima, sabiendo que la paz comienza en el corazón de cada persona.\n\nAmén.',
        intention: 'Por ser instrumento de paz',
        reflection:
            'La Virgen pidió especialmente oraciones por la paz del mundo, amenazada por la guerra. Su mensaje de paz es más urgente que nunca.',
      ),
      NovenaDay(
        dayNumber: 3,
        title: 'Día Tercero - La Conversión de los Pecadores',
        prayer:
            'Madre de Fátima, que pediste la conversión de los pecadores, ayúdame a convertir mi corazón a Dios y a ser un instrumento de conversión para otros.\n\nOh Virgen de Fátima, que pediste oraciones por la conversión de los pecadores, especialmente por los más alejados de Dios, te pido que me ayudes a convertir mi corazón a Dios cada día, alejándome del pecado y acercándome más a tu Hijo Jesucristo. Que tu intercesión me obtenga la gracia de una conversión profunda y duradera.\n\nAyúdame a ser un instrumento de conversión para otros, mostrándoles con mi vida y mis palabras el amor de Dios. Que tu ejemplo de compasión por los pecadores me inspire a acercarme a ellos con amor y misericordia.\n\nProtege especialmente a todos los pecadores que están alejados de Dios, ayudándoles a encontrar el camino de regreso a su amor. Que tu corazón maternal los conduzca hacia la conversión y la reconciliación.\n\nEnséñame a orar siempre por la conversión de los pecadores, como tú pediste en Fátima, sabiendo que tu Hijo vino a salvar a los pecadores.\n\nAmén.',
        intention: 'Por la conversión de los pecadores',
        reflection:
            'La Virgen pidió oraciones por la conversión de los pecadores, especialmente por los más alejados. Su compasión por los pecadores es infinita.',
      ),
      NovenaDay(
        dayNumber: 4,
        title: 'Día Cuarto - La Devoción al Inmaculado Corazón',
        prayer:
            'Virgen de Fátima, que pediste la devoción a tu Inmaculado Corazón, enséñame a amarte como madre y a consagrarme a tu corazón inmaculado.\n\nOh Madre Santísima, que en Fátima pediste la devoción a tu Inmaculado Corazón como camino de salvación, te pido que me ayudes a amarte como madre y a consagrarme completamente a tu corazón inmaculado. Que tu ejemplo de amor maternal me inspire a confiar siempre en tu intercesión.\n\nAyúdame a cultivar una devoción profunda a tu Inmaculado Corazón, rezando diariamente y ofreciendo mis oraciones y sacrificios por la conversión de los pecadores. Que tu intercesión me obtenga la gracia de ser un devoto fiel de tu corazón.\n\nProtege a todos los devotos de tu Inmaculado Corazón, especialmente a aquellos que están siendo probados en su fe. Que tu corazón maternal los consuele y los fortalezca.\n\nEnséñame a confiar siempre en tu Inmaculado Corazón, sabiendo que es el camino más seguro hacia tu Hijo Jesucristo.\n\nAmén.',
        intention: 'Por la devoción al Inmaculado Corazón',
        reflection:
            'La Virgen pidió la devoción a su Inmaculado Corazón como camino de salvación. Su corazón maternal nos conduce siempre a Cristo.',
      ),
      NovenaDay(
        dayNumber: 5,
        title: 'Día Quinto - El Rezo del Rosario',
        prayer:
            'Reina del Rosario, que pediste el rezo diario del Rosario, ayúdame a ser fiel a esta devoción y a difundir el amor por el Rosario.\n\nOh Virgen de Fátima, Reina del Rosario, que pediste el rezo diario del Rosario como arma poderosa contra el mal, te pido que me ayudes a ser fiel a esta devoción, rezando el Rosario cada día con amor y devoción. Que tu ejemplo de amor por el Rosario me inspire a difundir esta devoción entre todos los que me rodean.\n\nAyúdame a ver el Rosario como una oración poderosa que puede cambiar el mundo, como tú lo prometiste en Fátima. Que tu intercesión me obtenga la gracia de rezar el Rosario con fervor y perseverancia.\n\nProtege a todos los que rezan el Rosario, especialmente a aquellos que están siendo tentados o perseguidos. Que tu intercesión los fortalezca en su fe y los proteja del mal.\n\nEnséñame a amar el Rosario como tú lo amas, sabiendo que es una oración que puede obtener grandes milagros.\n\nAmén.',
        intention: 'Por el rezo fiel del Rosario',
        reflection:
            'La Virgen pidió el rezo diario del Rosario como arma poderosa contra el mal. El Rosario es una oración que puede cambiar el mundo.',
      ),
      NovenaDay(
        dayNumber: 6,
        title: 'Día Sexto - La Penitencia',
        prayer:
            'Virgen de Fátima, que pediste penitencia por los pecadores, ayúdame a ofrecer sacrificios por amor y a vivir un espíritu de penitencia.\n\nOh Madre Santísima, que en Fátima pediste penitencia y sacrificios por la conversión de los pecadores, te pido que me ayudes a ofrecer sacrificios por amor, aceptando con paciencia las dificultades de la vida y ofreciéndolas por la conversión de los pecadores. Que tu ejemplo de compasión por los pecadores me inspire a ser generoso en mis sacrificios.\n\nAyúdame a vivir un espíritu de penitencia, haciendo pequeños sacrificios cada día por amor a Dios y al prójimo. Que tu intercesión me obtenga la gracia de ser generoso en mis ofrendas y penitencias.\n\nProtege especialmente a todos aquellos que están sufriendo y que ofrecen sus sufrimientos por la conversión de los pecadores. Que tu corazón maternal los consuele y les ayude a encontrar sentido en su sufrimiento.\n\nEnséñame a ofrecer siempre mis sacrificios por amor, como tú pediste en Fátima, sabiendo que pueden ayudar a la conversión de muchos pecadores.\n\nAmén.',
        intention: 'Por el espíritu de penitencia',
        reflection:
            'La Virgen pidió penitencia y sacrificios por la conversión de los pecadores. Nuestros sacrificios pueden ayudar a la salvación de muchas almas.',
      ),
      NovenaDay(
        dayNumber: 7,
        title: 'Día Séptimo - La Consagración a Rusia',
        prayer:
            'Madre de Fátima, que pediste la consagración de Rusia a tu Inmaculado Corazón, ruega por la conversión de ese país y de todos los países que necesitan tu intercesión.\n\nOh Virgen de Fátima, que pediste la consagración de Rusia a tu Inmaculado Corazón para su conversión, te pido que tengas misericordia de ese país y de todos los países que necesitan tu intercesión. Que tu corazón maternal se compadezca de todos los pueblos que sufren persecución o que están alejados de Dios.\n\nAyúdame a orar siempre por la conversión de Rusia y de todos los países que necesitan el amor de Dios. Que tu intercesión me obtenga la gracia de ser un instrumento de evangelización en el mundo.\n\nProtege especialmente a todos los cristianos que sufren persecución en diferentes países del mundo. Que tu corazón maternal los consuele y les ayude a mantener viva su fe.\n\nEnséñame a confiar siempre en tu poder de intercesión, sabiendo que tu Inmaculado Corazón puede convertir a los pueblos más alejados de Dios.\n\nAmén.',
        intention: 'Por la conversión de Rusia',
        reflection:
            'La Virgen pidió la consagración de Rusia a su Inmaculado Corazón para su conversión. Su intercesión puede convertir a todos los pueblos.',
      ),
      NovenaDay(
        dayNumber: 8,
        title: 'Día Octavo - El Milagro del Sol',
        prayer:
            'Virgen de Fátima, que realizaste el milagro del sol el 13 de octubre de 1917, aumenta mi fe en tu poder y en tu amor, y ayúdame a ser un testigo de tu poder milagroso.\n\nOh Madre Santísima, que realizaste el milagro del sol para confirmar tus apariciones y aumentar la fe de miles de personas, te pido que aumentes mi fe en tu poder y en tu amor. Que tu milagro me recuerde que eres real y que tienes poder para obrar grandes milagros.\n\nAyúdame a ser un testigo de tu poder milagroso, compartiendo con otros la historia del milagro del sol y el mensaje de Fátima. Que tu intercesión me obtenga la gracia de ser un evangelizador valiente de tu amor.\n\nProtege a todos aquellos que dudan de tu existencia o de tu poder, especialmente a los que han perdido la fe. Que tu milagro les ayude a encontrar el camino de regreso a Dios.\n\nEnséñame a confiar siempre en tu poder milagroso, sabiendo que puedes obrar grandes milagros en mi vida y en la vida de otros.\n\nAmén.',
        intention: 'Por el aumento de la fe',
        reflection:
            'El milagro del sol confirmó las apariciones y aumentó la fe de miles de personas. Este milagro fortalece nuestra fe en su intercesión.',
      ),
      NovenaDay(
        dayNumber: 9,
        title: 'Día Noveno - La Promesa de Salvación',
        prayer:
            'Reina de Fátima, que prometiste que tu Inmaculado Corazón triunfará, ayúdame a confiar en tu promesa y a trabajar por el triunfo de tu corazón inmaculado en el mundo.\n\nOh Virgen de Fátima, que prometiste que tu Inmaculado Corazón triunfará, trayendo paz al mundo, te pido que me ayudes a confiar siempre en tu promesa y a trabajar por el triunfo de tu corazón inmaculado en el mundo. Que tu promesa me dé esperanza en estos tiempos difíciles.\n\nAyúdame a ser un instrumento del triunfo de tu Inmaculado Corazón, difundiendo tu mensaje de paz, conversión y amor en el mundo. Que tu intercesión me obtenga la gracia de ser un apóstol de tu amor.\n\nProtege especialmente a todos aquellos que trabajan por el triunfo de tu Inmaculado Corazón, ayudándoles a ser fieles a tu mensaje. Que tu corazón maternal los sostenga en su misión.\n\nEnséñame a confiar siempre en tu promesa de salvación, sabiendo que tu Inmaculado Corazón triunfará al final.\n\nAmén.',
        intention: 'Por el triunfo del Inmaculado Corazón',
        reflection:
            'La Virgen prometió que su Inmaculado Corazón triunfará, trayendo paz al mundo. Su promesa nos da esperanza para el futuro.',
      ),
    ],
  );
}
