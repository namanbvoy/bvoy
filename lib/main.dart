import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HealthCentreView(),
    );
  }
}

class HealthCentreView extends StatelessWidget {
  final HealthCentreData data = HealthCentreData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 148, 51, 1.0),
                  Color.fromRGBO(237, 74, 112, 1.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    healthCentreTitle(context),
                    verticalScrollView(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget healthCentreTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFEAEAF4),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8),
          Text(
            data.subTitle,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFEAEAF4),
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget verticalScrollView(BuildContext context) {
    return Column(
      children: data.healthCentreItems.map((item) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: HealthCentreCell(healthCentre: item),
        );
      }).toList(),
    );
  }
}

class HealthCentreCell extends StatelessWidget {
  final HealthCentreItem healthCentre;

  const HealthCentreCell({required this.healthCentre, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HealthCentreDetailView(healthCentre: healthCentre),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(healthCentre.imageName),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Colors.transparent, Color(0xFF000000)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Center(
              child: Text(
                healthCentre.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HealthCentreDetailView extends StatelessWidget {
  final HealthCentreItem healthCentre;

  const HealthCentreDetailView({required this.healthCentre, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(healthCentre.text),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    healthCentre.imageName,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                healthCentre.text,
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFEAEAF4),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.white),
              const SizedBox(height: 10),
              Text(
                healthCentre.description,
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Mock Data Classes
class HealthCentreData {
  String title = "Health Centre";
  String subTitle = "Explore our curated content for your well-being";
  Gradient healthCentreBackgroundGradient = const LinearGradient(
    colors: [Colors.blue, Colors.purple],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  List<HealthCentreItem> healthCentreItems = HealthCentreItem.exampleData;
}

class HealthCentreItem {
  final String text;
  final String imageName;
  final String description;

  HealthCentreItem({
    required this.text,
    required this.imageName,
    required this.description,
  });

  static final List<HealthCentreItem> exampleData = [
    HealthCentreItem(
      text: "How Smiling Beats Stress?",
      imageName: 'assets/healthCentre1.png',
      description: '''
Knock! Knock! Who’s there? Tibet. Tibet who? Early Tibet and early to rise!

A human smile packs some serious power. Whether you're aiming to boost someone’s mood, melt hearts, or slow down a racing pulse, you don’t need a set of perfect, dazzling teeth to do it.

Duchenne Smile

Smile scientists (yes, they’re a thing) agree that the Duchenne smile is where the magic’s at. That’s the one that reaches your eyes, giving you those crinkly little crow’s feet—a dead giveaway of genuine happiness.
But hey, not every grin needs to go full-on Duchenne to get the job done. Non-Duchenne smiles aren’t exactly “fake,” but maybe more… let’s call them “polite.” These smiles are good for showing basic friendliness and, believe it or not, can also subtly signal a little psychological distance—perfectly useful in plenty of situations.

Why is smiling good?

Elevate mood: Smiling, especially genuine ones with crow feet, has been shown to elevate the mood. A 2014 study using MRI scans showed that engaging the muscles you use to smile also stimulates the part of your brain responsible for emotional response control.

Change how we respond to stress: Smiling leads to lower heart rates during stress recovery when compared to a neutral expression. Non-scientifically speaking, the more genuine your smile the less spike in heart rates during stress. Genuine smiles have also been shown to undo negative emotions over time.

Deeper social connections: A good smile is super contagious! It is almost impossible to pass a smiling person and not smile. Smiling helps break ice and form new connections we would otherwise have missed. Better still, smiling while with your friends and colleagues helps strengthen the connection.

References: Lupu-Merca, Violeta & Vaida, Sebastian. (2024). Benefits of the Duchenne Smile and Positive Emotions. A Systematic Review. Educatia 21. 27. 2024. 10.24193/ed21.2024.27.09.
  '''),
    HealthCentreItem(
      text: "Why Resting Heart Rate is Important?",
      imageName: 'assets/healthCentre2.png',
      description: '''
Providing adequate blood flow into the circulation is the key function of the heart. Heart rate is a simple, yet very insightful parameter of our health.

Heart rate is defined as the number of heart beats per minute. When it is measured while resting or in a sedentary stage, it is called Resting Heart Rate (RHR).  Normally the resting heart rate ranges between 60-100 beats per minute among the healthy young adult population. There are multiple factors that  influence our Resting Heart Rate:

·      Age
·      Gender
·      Posture
·      Hydration
·      Level of stress
·      Physical activity
·      Overuse of caffeine
·      Alcohol consumption
·      Smoking, and
·      Medications  


Why to monitor Resting Heart Rate?

Resting heart rate may reflect whether the cardiovascular physiology is working optimally or is deranged. During rest, the range of 60-100 beats per minute is sufficient to provide enough blood flow to the body without putting extra strain on the heart. Additionally, it provides us with a 200-300% cardiac reserve which means that we can increase the amount of blood pumped out by 2-3x when required, for instance, during exercise. This fact indicates that as our resting heart rate remains tlow, we have higher reserves to face the physical challenges. Hence, lower resting heart rate is the symbol of a healthy heart.  In trained athletes, the resting heart rate can be observed between 40 to 50 bpm. However, it can reach up to 180 to 200 bpm during their peak performance in a sporting event.

Regarding the pathology, resting heart rate can be linked directly with the disease outcomes.  Large epidemiological studies demonstrate the elevated resting heart rate (>90 bpm) in young adulthood is associated with hypertension  in middle age. The adverse cardiovascular events namely, myocardial infarction, stroke and sudden heart failures are more prone to develop in the individuals who consistently have higher resting heart rates. On the other hand, lower resting heart rates (< 60 bpm) can be linked to fainting episodes due to sick sinus syndrome or a possibility of heart blockage.


References:

1.      Olshansky, B., Ricci, F., & Fedorowski, A. (2022). Importance of resting heart rate. Trends in cardiovascular medicine, S1050-1738(22)00073-1. Advance online publication. https://doi.org/10.1016/j.tcm.2022.05.006

2.     Nelson, B.W., Low, C.A., Jacobson, N. et al. Guidelines for wrist-worn consumer wearable assessment of heart rate in biobehavioral research. npj Digit. Med. 3, 90 (2020). https://doi.org/10.1038/s41746-020-0297-4.

3.     ACSM’s Guidelines for exercise prescription and testing. 10th edition.
  ''' ),
        HealthCentreItem(
      text: "Stress and Your Heart Rate",
      imageName: 'assets/healthCentre3.png',
      description: '''
What is stress?

Stress is the body's response to any challenging situation. Stress was the term, used earlier in physics to describe the interaction between force and resistance applied to counter that force. Han Selye (1907 - 1982) was the first scientist to introduce the term stress in medicine context. 

How is stress linked with heart rate?

Any kind of stress, whether physical or mental, induces the nervous and hormonal system in a way that prepares our body to deal with the situation. With the help of autonomic branch of the nervous system, vitals such as heart rate, breathing rate, temperature and blood pressure etc. are controlled. Autonomic nervous system plays its role via two types of control systems: Sympathetic and parasympathetic. In the presence of stress, sympathetic control predominates which consequently excites the cardio-respiratory systems. As a stress response, heart rate, blood pressure and breathing rate increase. Opposite to this, the parasympathetic nervous system helps to maintain the normalcy of the body's internal environment during routine tasks. 

Regarding the hormonal system, adrenaline, nor-adrenaline are the hormones released from the adrenal glands in times of stress. These hormones excite the heart to beat faster and speed up the blood circulation. Cortisol is another hormone, released by adrenals as a response to stress, it controls the metabolic and inflammatory reactions of our body. The metabolism in liver and muscles becomes faster to provide glucose as a quick energy source. Overall, the aim of stress response is to increase the blood supply, nutrition and oxygen to our active muscles.

As part of our evolution as hunters and gatherers, the nervous and hormonal controls are targeted to generate a response called the “Fight or flight response”. The fight or flight response conditioned our body to deal with life threatening situations like being chased by a bear.

In current times, such dangerous situations are less likely to occur, however, psychological pressure generates a similar response in our bodies. The prolonged or frequent presence of psychological stimuli keeps the sympathetic nervous system in activation continuously elevating our heart and respiratory rates.

References: Taelman, J., Vandeput, S., Spaepen, A., & Huffel, S. (2009). Influence of Mental Stress on Heart Rate and Heart Rate Variability. , 1366-1369. https://doi.org/10.1007/978-3-540-89208-3_324.
  '''),
        HealthCentreItem(
      text: "Why is Deep Sleep Important?",
      imageName: 'assets/healthCentre4.png',
      description: '''
When we feel mentally fatigued, we often associate sleep with providing rest and relaxation for the brain. However, the belief that the brain rests during sleep is a misconception. In reality, sleep enables the brain to function more efficiently by allowing it to disconnect from external stimuli and focus on its essential internal processes. Additionally, while the body is at rest, other organs continue to operate at baseline levels, which further supports optimal brain function.


What is deep sleep?

While asleep, the brain progresses through various sleep stages, which are classified based on brain wave patterns recorded by an electroencephalogram (EEG). Broadly, these stages are divided into two categories: Non-Rapid Eye Movement (NREM) sleep and Rapid Eye Movement (REM) sleep. NREM sleep is further subdivided into three stages: N1, N2, and N3. The sequential progression through these stages is known as a sleep cycle, with each cycle lasting approximately 90 minutes. Over the course of a full night's sleep, an individual typically experiences 4 to 5 sleep cycles.

Among the stages, the N3 stage of NREM, commonly referred to as slow-wave sleep or deep sleep, is particularly important. Deep sleep lasts between 20 to 40 minutes during the first half of the night, and its duration decreases as sleep progresses. In total, deep sleep comprises 10-20% of overall sleep duration.

Consistent deep sleep is crucial for various aspects of both our physical and mental health. As we progress through the week some of us build psychological strain from our work lives. Consistent sleep acts as a buffer against late-week psychological strain, enhancing stress management and preventive negative health effects (Lariss K. Barber et al. 2009).


Some of the benefits of getting consistent deep sleep are: 

Enhanced learning efficiency and memory consolidation: deep sleep is essential for restoring the brain's capacity to learn efficiently and save important memories from the day.

Brain waste clearance and general brain health: during deep sleep the brain clears its waste by increasing the circulation of the CSF (Cerebro Spinal Fluid). These waste products are linked to neurodegenrative diseases like Alzheimer's.

Body restoration: our body releases the growth hormone (HGH) during deep sleep stage which promotes growth and development of the body and helps in muscle and tissue repair. It also influences the secretion of cytokines like IL-6 and TNF-alpha, which are involved in immune responses and can affect sleep quality and daytime alertness

Cognitive Function & Sleep Architecture: The structure of sleep, including the duration and quality of deep sleep, is crucial for cognitive functions. Fragmentation of sleep, even without reducing the total sleep time, can lead to significant cognitive deficits. 


How can you improve Deep Sleep consistency?

Consistent sleep schedule
Sufficient sleep duration: most studies suggest atleast 7 hours of sleep per night
Avoid caffeine & heavy meals before bedtime
Exercise regularly
Limit exposure to screens before bed and most importantly, make your bedroom super conducive to sleep


Reference: Barrett, B., Harden, C., Brown, R., Coe, C., & Irwin, M. (2020). Mindfulness meditation and exercise both improve sleep quality: Secondary analysis of a randomized controlled trial of community dwelling adults.. Sleep health. https://doi.org/10.1016/j.sleh.2020.04.003.
  '''),
        HealthCentreItem(
      text: "Physical Activity and Mental Well-being",
      imageName: 'assets/healthCentre5.png',
      description: '''
Physical activity has proven, through hundreds of studies, to be a means of upgrading life quality through enhanced self-esteem, improved mood states, reduced state and trait anxiety, resilience to stress, or improved sleep. Regular exercise offers a natural and effective approach to supporting mental health. 

Physical activity produces endorphins, often called “feel-good hormones” which can immediately elevate mood and reduce stress. Research published in the Journal of Clinical Psychiatry has shown that just 30 minutes of moderate exercise can trigger the release of these beneficial neurochemicals. 

Physical activity, especially aerobic exercise, is associated with increased gray matter volume in regions such as the prefrontal cortex, hippocampus, and supplementary motor area. These changes are linked to improvements in cognitive and physical performance.

The other major benefit of physical activity is improved mood and self-esteem. Exercise enhances physical self-concept, which in turn positively influences self-esteem and mental well-being.

Low to moderate physical activity have proven to improve sleep quality considerably which is a crucial aspect in improving one’s mental wellbeing. Mind body exercises such as yoga and tai chi have shown to improve subjective sleep quality.

Lastly, social aspects of physical activity shouldn't be overlooked. Group exercises, team sports, or even casual walking groups provide opportunities for social interaction and community building, which are crucial factors in maintaining good mental health. The British Journal of Sports Medicine has documented how these social connections formed through physical activity contribute to reduced feelings of isolation and improved mood.

For optimal mental health benefits, experts recommend at least 150 minutes of moderate-intensity aerobic activity or 75 minutes of vigorous activity per week. However, even small amounts of physical activity can make a difference. The key is consistency and finding activities that are enjoyable and sustainable for long-term practice.


References: 

Fox, K. (1999). The influence of physical activity on mental well-being. Public Health Nutrition, 2, 411 - 418. https://doi.org/10.1017/S1368980099000567.

Zhao, H., Lu, C., & Yi, C. (2023). Physical Activity and Sleep Quality Association in Different Populations: A Meta-Analysis. International Journal of Environmental Research and Public Health, 20. https://doi.org/10.3390/ijerph20031864.

Valkenborghs, S., Noetel, M., Hillman, C., Nilsson, M., Smith, J., Ortega, F., & Lubans, D. (2019). The Impact of Physical Activity on Brain Structure and Function in Youth: A Systematic Review. Pediatrics, 144. https://doi.org/10.1542/peds.2018-4032.
'''),
  ];
}
