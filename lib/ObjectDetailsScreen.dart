import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ObjectDetails extends StatefulWidget {
  final String parameter;

  const ObjectDetails({required this.parameter});

  @override
  State<ObjectDetails> createState() => _ObjectDetailsState();
}

class _ObjectDetailsState extends State<ObjectDetails> {
  // Static data mapped by parameter using local image paths
  final Map<String, Map<String, dynamic>> staticData = {
    'Jampelyang': {
      'imgurls': 'painting/manjushri.jpg', // Local image path
      'heading': 'Jampelyang',
      'Descriptions': 'Iconography: Jampelyang is depicted as a male bodhisattva wielding a flaming sword in his right hand, representing the realization of transcendent wisdom which cuts down ignorance and duality. The scripture supported by the padma (lotus) held in his left hand is a Prajñāpāramitā sūtra, representing his attainment of ultimate realization from the blossoming of wisdom.',
      'Descriptions1': 'Manjushri is considered a fully enlightened Buddha who chose to remain in the world in the form of a Bodhisattva to help others achieve enlightenment. He is also considered the master of all the Buddhas and Bodhisattvas, as he is the embodiment of their collective wisdom. In the context of Buddhist teachings, Manjushri symbolizes the importance of wisdom and intellectual understanding in the path to enlightenment. His iconography and teachings remind us that wisdom is not merely a passive state of knowing, but an active process of cutting through ignorance and delusion.',
    },
    'Buddha_Shakyamuni': {
      'imgurls': 'painting/buddha.jpg',
      'heading': 'Buddha_Shakyamuni',
      'Descriptions': 'Prince Siddhartha was born in Lumbini Grove around 563 or 566 B.C.E. to a royal Shakya family. Raised in luxury, he later renounced his palace life after witnessing the suffering of old age, sickness, and death. At 29, he became a wandering ascetic in search of truth.',
      'Descriptions1': 'At 35, Siddhartha attained enlightenment under the Bodhi tree in Bodhgaya, becoming the Buddha. He spent the rest of his life teaching the path to liberation, sharing the Four Noble Truths and guiding countless beings toward freedom from suffering.',
    },
    'Chana_Dorji': {
      'imgurls': 'painting/Vajrapani.jpg',
      'heading': 'Chana Dorji',
      'Descriptions': 'Chana Dorje (also known as Vajrapani) is one of the 8 “important” Bodhisattvas and is the god of power and energy, rain and thunder, and snakes. Chana Dorje also protects people from the Naga, which are beings found in lakes and rivers and make people sick.',
      'Descriptions1': 'Chana Dorje is recognizable by his blue color, snake necklace, five skull crown, and tiger skirt. He holds the dorje (vajra or “diamond thunderbolt”) high with his right hand in the tarjani mundra, a threatening gesture signifying that he’s ready to hurl a thunderbolt from the dorje. He is commonly worshipped and depicted along with the Bodhisattvas of compassion and wisdom as part of the Rig Sum Gonpo trinity.',
    },
    'Zhabdrung_Ngawang_Namgyel': {
      'imgurls': 'painting/zhabdrung.jpg',
      'heading': 'Zhabdrung Ngawang Namgyel',
      'Descriptions': 'In the enchanting realm of Bhutan, amidst towering Himalayan peaks and pristine landscapes, lies a legacy deeply embedded in the countrys spiritual and cultural identity—Zhabdrung Ngawang Namgyal. Often hailed as the spiritual architect of Bhutan, Zhabdrungs life story weaves together history, spirituality, and the remarkable transformation of a nation.',
      'Descriptions1': 'Zhabdrung Ngawang Namgyal is a seminal figure in the history of Bhutan, credited with unifying the country in the 17th century and establishing a distinct Bhutanese cultural identity. He was a Tibetan Buddhist Lama and the founder of the Drukpa Lineage state in Bhutan, which laid the foundation for the modern Kingdom of Bhutan.',
    },
    'Medicine_Buddha': {
      'imgurls': 'painting/Medicine.jpg',
      'heading': 'Medicine Buddha',
      'Descriptions': 'Bhaiṣajyaguru, also known as the Medicine Buddha, is a central figure in Mahāyāna Buddhism known for healing and easing suffering through his teachings. His full name means "Medicine Master and King of Lapis Lazuli Light," and he is often shown holding a medicine jar, symbolizing his role as a spiritual healer.',
      'Descriptions1': 'He is usually depicted in a traditional Buddha form with blue or green skin. While Akshobhya is typically known as the guardian of the East, Bhaiṣajyaguru is sometimes given that role, such as at Mount Kōya’s Kongōbu Temple in Japan.',
    },
    'Chenrezig': {
      'imgurls': 'painting/chenrizig.jpg',
      'heading': 'Chenrezig',
      'Descriptions': 'Avalokiteśvara, also known as Chenrezig in Tibetan and Lokeśvara in Sanskrit, is a bodhisattva of great compassion in Buddhism. Often linked with Amitabha Buddha, he is said to have 108 manifestations and is revered for his vow to help all sentient beings. Some texts even describe him as the divine source of many Hindu deities.',
      'Descriptions1': 'Originally depicted as male in Indian Buddhism, Avalokiteśvara is portrayed as female in East Asia, where she is widely known as Guanyin in China. She is also called Kannon in Japan, Gwaneum in Korea, and Quan Âm in Vietnam, and is venerated in both Buddhism and local folk religions.',
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = staticData[widget.parameter.trim()];

    if (data == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            'No data found.',
            style: TextStyle(fontFamily: 'Dosis'),
          ),
        ),
      );
    }

    final imageUrl = data['imgurls'];
    final heading = data['heading'];
    final description = data['Descriptions'];
    final description1 = data['Descriptions1'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 98, 40),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 10,
            child: SvgPicture.asset(
              'assets/Border_BR.svg',
              color: const Color.fromARGB(255, 223, 98, 40),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: SvgPicture.asset(
              'assets/Border_BL.svg',
              color: const Color.fromARGB(255, 223, 98, 40),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imageUrl,
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        heading,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Dosis',
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Dosis',
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        description1,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Dosis',
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
