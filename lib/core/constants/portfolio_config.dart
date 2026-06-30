part of 'constants.dart';

class PortfolioConfig {
  PortfolioConfig._();

  static const String name = 'MONIS BAIG';
  static const String roleHighlight = 'Developer';
  static const String roleSecondary = '+ Flutter Engineer';

  static const String introduction =
      'Senior Flutter Developer with 5+ years of experience designing, '
      'building, and scaling high-performance cross-platform mobile '
      'applications across fintech, telecom, healthcare, and social-impact '
      'domains. Proven track record leading end-to-end app development, '
      'mentoring junior engineers, and delivering complex solutions for '
      'clients in Pakistan, UAE, USA, and the wider MENA region. Skilled '
      'in modern state management (Bloc, Riverpod, Provider), third-party '
      'SDK integrations, payment gateways, and creating exceptional UI/UX '
      'designs using Figma.';

  static const String skillsHeading =
      "Here are a few technologies I've been working with recently:";

  static const List<String> skills = [
    'Flutter',
    'Dart',
    'Bloc',
    'Riverpod',
    'Provider',
    'Firebase',
    'RESTful APIs',
    'Socket.IO',
    'Payment Gateways',
    'Third-party SDKs',
    'Google ML Kit',
    'Figma',
    'CI/CD',
    'Git',
    'Cursor',
  ];

  static const List<String> navItems = [
    'About',
    'Experience',
    'Work',
    'Contact',
  ];

  static const List<String> navSectionIds = [
    'about',
    'experience',
    'work',
    'contact',
  ];

  static const String resumeUrl = 'https://flowcv.com/resume/sv7vrsfwso';
  static const String githubUrl = 'https://github.com/monisbaig';
  static const String linkedInUrl = 'https://www.linkedin.com/in/monis-baig-70240818b';
  static const String emailUrl = 'https://mail.google.com/mail/?view=cm&fs=1&to=monisbaig20@gmail.com';

  static const String formspreeUrl = 'https://formspree.io/f/mpqgjrrr';

  static const String experienceHeading = "Where I've Worked";
  static const String workHeading = "Some Things I've Built";

  static const int workInitialVisibleCount = 3;

  static const List<ProjectEntry> projects = [
    ProjectEntry(
      title: 'Araby AI',
      description:
          'Developed Araby AI, a bilingual productivity app with AI-driven features like chatbots, content generation, and marketing tools. Enhanced workflows through text-to-image generation and coding assistance.',
      technologies: ['Flutter', 'Dart', 'Bloc', 'Firebase', 'AI Integration'],
      externalUrl: 'https://play.google.com/store/apps/details?id=com.araby.ai',
    ),
    ProjectEntry(
      title: 'Emirates RC',
      description:
          'Developed the Emirates Red Crescent app, enabling news access, donations, project sponsorships, and orphan support tracking. Integrated branch navigation, volunteer applications, and social media connectivity for enhanced user engagement.',
      technologies: ['Flutter', 'Dart', 'REST APIs', 'Maps', 'Social SDKs'],
      externalUrl: 'https://play.google.com/store/apps/details?id=ae.rcuae.rcuae_app',
    ),
    ProjectEntry(
      title: 'My Sudani',
      description:
          'Contributed to My Sudani, a telecom self-care app giving Sudani users complete control over their services recharge, bundle purchases, bill payments, and account management through a fast, secure, and intuitive interface with zero data usage for in-app navigation.',
      technologies: ['Flutter', 'Dart', 'Telecom APIs', 'Payment Gateway'],
      externalUrl: 'https://play.google.com/store/apps/details?id=com.selfcare.link',
    ),
    ProjectEntry(
      title: 'Ericsson ECR (Connected Recycling)',
      description:
          "Contributed to the ECR Mobile App, a mission-critical Android application within the Ericsson Connected Recycling ecosystem, enabling field agents and Collection Point Agents to collect, process, and manage data across staging points in the recycling value chain, feeding into the platform's web-based portal.",
      technologies: ['Flutter', 'Dart', 'Android', 'REST APIs', 'Offline Sync'],
    ),
  ];

  static const List<ExperienceEntry> experiences = [
    ExperienceEntry(
      company: 'Evamp & Saanga',
      title: 'Senior Flutter Developer',
      dateRange: 'Aug 2025 – Present',
      location: 'Islamabad, Pakistan',
      responsibilities: [
        'Developed and maintained fintech-focused mobile applications, building secure, high-performance features such as digital wallets, transaction flows, and account management aligned with industry compliance standards.',
        'Integrated payment gateways and third-party financial APIs, ensuring reliable, secure data handling and seamless real-time transaction processing for end users.',
        'Collaborated with cross-functional teams (product, backend, QA) to deliver scalable fintech solutions, applying modern Flutter architecture and state management practices to maintain code quality and performance.',
      ],
    ),
    ExperienceEntry(
      company: 'AIM Digital Technologies',
      tabLabel: 'AIM Digital',
      title: 'Senior Flutter Developer',
      dateRange: 'Sep 2024 – Jul 2025',
      location: 'Islamabad, Pakistan',
      responsibilities: [
        'Led the development of Albiware, a cloud-based management platform for a USA-based client serving restoration and home-service contractors, unifying job management, CRM, payments, and financial tracking into a single Flutter application.',
        'Served as project lead on Albiware and a Machine Monitoring System application, owning technical decisions, sprint planning, and delivery while coordinating directly with the client.',
        'Developed and optimized cross-platform applications with robust API integrations, adhering to modern Flutter best practices.',
        'Conducted code reviews and mentored junior developers, improving team efficiency and app performance.',
        'Designed and prototyped mobile app interfaces using Figma, ensuring responsive and user-friendly designs.',
      ],
    ),
    ExperienceEntry(
      company: 'Xrossapps',
      title: 'Senior Flutter Developer',
      dateRange: 'Sep 2024 – Oct 2024',
      location: 'Contract, Remote',
      responsibilities: [
        'Led the development of the Quran App, implementing translations, an audio player module, and other advanced features to enhance usability.',
        'Migrated and optimized existing apps for better cross-platform compatibility.',
      ],
    ),
    ExperienceEntry(
      company: 'MVP Application & Game Design L.L.C',
      tabLabel: 'MVP Application',
      title: 'Flutter Developer',
      dateRange: 'Apr 2024 – Aug 2024',
      location: 'Abu Dhabi, UAE',
      responsibilities: [
        'Developed and maintained scalable mobile applications with Flutter and Dart.',
        'Integrated third-party APIs to extend functionality and ensure seamless user experiences.',
        'Delivered high-quality interfaces aligned with best practices in UI/UX.',
      ],
    ),
    ExperienceEntry(
      company: 'Intaj Global FZE',
      title: 'Flutter Developer',
      dateRange: 'Mar 2023 – Feb 2024',
      location: 'Dubai, UAE',
      responsibilities: [
        'Spearheaded end-to-end development for flagship projects, including Smart Panda and Algeria Awards, focusing on clean code and scalability.',
        'Collaborated closely with stakeholders to implement innovative features.',
      ],
    ),
    ExperienceEntry(
      company: 'Stack Buffers Technologies',
      tabLabel: 'Stack Buffers',
      title: 'Flutter Developer',
      dateRange: 'Jan 2022 – Feb 2023',
      location: 'Rawalpindi, Pakistan',
      responsibilities: [
        'Designed and developed service-oriented apps like Wash Mesh and healthcare solutions like Pixel Care & Pixel Home, ensuring efficient resource management.',
      ],
    ),
    ExperienceEntry(
      company: 'Self-employed',
      tabLabel: 'Freelance',
      title: 'Freelance Flutter Developer',
      dateRange: 'Feb 2021 – Dec 2021',
      location: 'Rawalpindi, Pakistan',
      responsibilities: [
        'Delivered complete application solutions, including design, development, and deployment.',
        'Built strong client relationships by delivering customized, high-quality products.',
      ],
    ),
  ];
}
