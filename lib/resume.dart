import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:synapse/common.dart';

class Resume {
  // Class replicates jsonresume-based schema and offers constructor and json serialization
  String resumeId; // id of resume
  String resumeName; // name of resume

  String name = '';
  String label = '';
  String image = '';
  String email = '';
  String phone = '';
  String url = '';
  String summary = '';
  Location location = Location();
  List<Profile> profiles = [];
  List<Work> work = [];
  List<Volunteer> volunteer = [];
  List<Education> education = [];
  List<Award> awards = [];
  List<Skill> skills = [];
  List<Language> languages = [];
  List<Interest> interests = [];
  List<Reference> references = [];
  List<Publication> publications = [];
  List<Project> projects = [];

  Resume({String? resumeId, String resumeName = ''})
      : resumeId = resumeId ?? const Uuid().v4(),
        resumeName = resumeName.isEmpty ? 'New resume' : resumeName;

  factory Resume.fromJson(Map<String, dynamic> json) {
    // If field not found, skip it

    final List<Profile> profiles = (json['basics']['profiles'] as List)
        .map((e) => Profile.fromJson(e))
        .toList();
    final Location location = Location.fromJson(json['basics']['location']);
    final List<Work> work =
        (json['work'] as List).map((e) => Work.fromJson(e)).toList();
    final List<Volunteer> volunteer =
        (json['volunteer'] as List).map((e) => Volunteer.fromJson(e)).toList();
    final List<Education> education =
        (json['education'] as List).map((e) => Education.fromJson(e)).toList();
    final List<Award> awards =
        (json['awards'] as List).map((e) => Award.fromJson(e)).toList();
    final List<Skill> skills =
        (json['skills'] as List).map((e) => Skill.fromJson(e)).toList();
    final List<Language> languages =
        (json['languages'] as List).map((e) => Language.fromJson(e)).toList();
    final List<Interest> interests =
        (json['interests'] as List).map((e) => Interest.fromJson(e)).toList();
    final List<Reference> references =
        (json['references'] as List).map((e) => Reference.fromJson(e)).toList();
    final List<Publication> publications = (json['publications'] as List)
        .map((e) => Publication.fromJson(e))
        .toList();
    final List<Project> projects =
        (json['projects'] as List).map((e) => Project.fromJson(e)).toList();

    return Resume(
        resumeId: json['meta']['id'], resumeName: json['meta']['name'])
      ..name = json['basics']['name']
      ..label = json['basics']['label']
      ..image = json['basics']['image']
      ..email = json['basics']['email']
      ..phone = json['basics']['phone']
      ..url = json['basics']['url']
      ..summary = json['basics']['summary']
      ..profiles = profiles
      ..location = location
      ..work = work
      ..volunteer = volunteer
      ..education = education
      ..awards = awards
      ..skills = skills
      ..languages = languages
      ..interests = interests
      ..references = references
      ..publications = publications
      ..projects = projects;
  }

  Map<String, dynamic> toJson() => {
        'resumeId': resumeId,
        'resumeName': resumeName,
        'basics': {
          'name': name,
          'label': label,
          'image': image,
          'email': email,
          'phone': phone,
          'url': url,
          'summary': summary,
          'location': location
        },
        'work': work,
        'education': education,
        'skills': skills,
        'languages': languages,
        'interests': interests,
        'references': references,
        'publications': publications,
        'projects': projects
      };
}

class Profile {
  String network = '';
  String username = '';
  String url = '';

  Profile(this.network, this.username, this.url);

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(json['network'], json['username'], json['url']);
  }

  Map<String, dynamic> toJson() =>
      {'network': network, 'username': username, 'url': url};
}

class Location {
  String address = '';
  String postalCode = '';
  String city = '';
  String countryCode = '';
  String region = '';

  Location();

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location()
      ..address = json['address']
      ..postalCode = json['postalCode']
      ..city = json['city']
      ..countryCode = json['countryCode']
      ..region = json['region'];
  }

  Map<String, dynamic> toJson() => {
        'address': address,
        'postalCode': postalCode,
        'city': city,
        'countryCode': countryCode,
        'region': region
      };
}

class Work {
  String name;
  String position;
  String url = '';
  String startDate = '';
  String endDate = '';
  String summary = '';
  List<String> highlights = [];

  Work(this.name, this.position);

  factory Work.fromJson(Map<String, dynamic> json) {
    final List<String> highlights =
        (json['highlights'] as List).map((e) => e.toString()).toList();

    return Work(json['name'], json['position'])
      ..url = json['url']
      ..startDate = json['startDate']
      ..endDate = json['endDate']
      ..summary = json['summary']
      ..highlights = highlights;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'position': position,
        'url': url,
        'startDate': startDate,
        'endDate': endDate,
        'summary': summary,
        'highlights': highlights
      };
}

class Volunteer {
  String organization;
  String position;
  String url = '';
  String startDate = '';
  String endDate = '';
  String summary = '';
  List<String> highlights = [];

  Volunteer(this.organization, this.position);

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    final List<String> highlights =
        (json['highlights'] as List).map((e) => e.toString()).toList();

    return Volunteer(json['organization'], json['position'])
      ..url = json['url']
      ..startDate = json['startDate']
      ..endDate = json['endDate']
      ..summary = json['summary']
      ..highlights = highlights;
  }

  Map<String, dynamic> toJson() => {
        'organization': organization,
        'position': position,
        'url': url,
        'startDate': startDate,
        'endDate': endDate,
        'summary': summary,
        'highlights': highlights
      };
}

class Education {
  String institution;
  String area;
  String studyType;
  String url = '';
  String startDate = '';
  String endDate = '';
  String score = '';
  List<String> courses = [];

  Education(this.institution, this.area, this.studyType);

  factory Education.fromJson(Map<String, dynamic> json) {
    final List<String> courses =
        (json['courses'] as List).map((e) => e.toString()).toList();

    return Education(json['institution'], json['area'], json['studyType'])
      ..url = json['url']
      ..startDate = json['startDate']
      ..endDate = json['endDate']
      ..score = json['score']
      ..courses = courses;
  }

  Map<String, dynamic> toJson() => {
        'institution': institution,
        'url': url,
        'area': area,
        'studyType': studyType,
        'startDate': startDate,
        'endDate': endDate,
        'score': score,
        'courses': courses
      };
}

class Award {
  String title;
  String date = '';
  String awarder = '';
  String summary = '';

  Award(this.title);

  factory Award.fromJson(Map<String, dynamic> json) {
    return Award(json['title'])
      ..date = json['date']
      ..awarder = json['awarder']
      ..summary = json['summary'];
  }

  Map<String, dynamic> toJson() =>
      {'title': title, 'date': date, 'awarder': awarder, 'summary': summary};
}

class Publication {
  String name;
  String publisher = '';
  String releaseDate = '';
  String url = '';
  String summary = '';

  Publication(this.name);

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(json['name'])
      ..publisher = json['publisher']
      ..releaseDate = json['releaseDate']
      ..url = json['url']
      ..summary = json['summary'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'publisher': publisher,
        'releaseDate': releaseDate,
        'url': url,
        'summary': summary
      };
}

class Skill {
  String name;
  String level = '';
  List<String> keywords = [];

  Skill(this.name);

  factory Skill.fromJson(Map<String, dynamic> json) {
    List<String> keywords =
        (json['keywords'] as List).map((e) => e.toString()).toList();

    return Skill(json['name'])
      ..level = json['level']
      ..keywords = keywords;
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'level': level, 'keywords': keywords};
}

class Language {
  String language;
  String fluency = '';

  Language(this.language);

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(json['language'])..fluency = json['fluency'];
  }

  Map<String, dynamic> toJson() => {'language': language, 'fluency': fluency};
}

class Interest {
  String name;
  List<String> keywords = [];

  Interest(this.name);

  factory Interest.fromJson(Map<String, dynamic> json) {
    List<String> keywords =
        (json['keywords'] as List).map((e) => e.toString()).toList();

    return Interest(json['name'])..keywords = keywords;
  }

  Map<String, dynamic> toJson() => {'name': name, 'keywords': keywords};
}

class Reference {
  String name;
  String reference;

  Reference(this.name, this.reference);

  factory Reference.fromJson(Map<String, dynamic> json) {
    return Reference(json['name'], json['reference']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'reference': reference};
}

class Project {
  String name;
  String description = '';
  String startDate = '';
  String endDate = '';
  String url = '';
  List<String> keywords = [];
  List<String> highlights = [];
  List<String> roles = [];
  String entity = '';
  String type = '';

  Project(this.name);

  factory Project.fromJson(Map<String, dynamic> json) {
    final List<String> keywords =
        (json['keywords'] as List).map((e) => e.toString()).toList();
    final List<String> highlights =
        (json['highlights'] as List).map((e) => e.toString()).toList();
    final List<String> roles =
        (json['roles'] as List).map((e) => e.toString()).toList();

    return Project(json['name'])
      ..description = json['description']
      ..startDate = json['startDate']
      ..endDate = json['endDate']
      ..url = json['url']
      ..keywords = keywords
      ..roles = roles
      ..entity = json['entity']
      ..type = json['type']
      ..highlights = highlights;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'startDate': startDate,
        'endDate': endDate,
        'url': url,
        'keywords': keywords,
        'roles': roles,
        'entity': entity,
        'type': type,
        'highlights': highlights
      };
}

// Editors
class ResumeEditor extends StatefulWidget {
  final Resume resume;
  final Function(Resume) onSaved;

  const ResumeEditor({Key? key, required this.resume, required this.onSaved})
      : super(key: key);

  @override
  _ResumeEditorState createState() => _ResumeEditorState();
}

class _ResumeEditorState extends State<ResumeEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: TextEditingController(text: widget.resume.resumeName),
          onChanged: (value) => widget.resume.resumeName = value,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.name),
            onChanged: (value) => widget.resume.name = value,
            decoration: const InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.label),
            onChanged: (value) => widget.resume.label = value,
            decoration: const InputDecoration(
              labelText: 'Label',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.email),
            onChanged: (value) => widget.resume.email = value,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.phone),
            onChanged: (value) => widget.resume.phone = value,
            decoration: const InputDecoration(
              labelText: 'Phone',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.url),
            onChanged: (value) => widget.resume.url = value,
            decoration: const InputDecoration(
              labelText: 'url',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.summary),
            onChanged: (value) => widget.resume.summary = value,
            maxLines: 5,
            maxLength: 300,
            decoration: const InputDecoration(
              labelText: 'Summary',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          // Location: multiple fields
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller:
                      TextEditingController(text: widget.resume.location.city),
                  onChanged: (value) => widget.resume.location.city = value,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: TextField(
                  controller: TextEditingController(
                      text: widget.resume.location.countryCode),
                  onChanged: (value) =>
                      widget.resume.location.countryCode = value,
                  decoration: const InputDecoration(
                    labelText: 'Country Code',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),

          // Profiles Box with ListView of Cards and "Add" Button
          TileListField<Profile>(
            title: 'Profiles',
            items: widget.resume.profiles,
            dialogBuilder: (context, [Profile? profile]) {
              return ProfileEditor(profile: profile);
            },
            itemBuilder: (context, profile) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.network, style: const TextStyle(fontSize: 16)),
                  Text(profile.username,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),
          const SizedBox(height: 16.0),

          // Work Box with ListView of draggable Cards and "Add" Button
          TileListField<Work>(
            title: 'Work',
            items: widget.resume.work,
            dialogBuilder: (context, [Work? work]) {
              return WorkEditor(work: work);
            },
            itemBuilder: (context, work) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(work.name, style: const TextStyle(fontSize: 16)),
                  Text(work.position,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),
          const SizedBox(height: 16.0),

          // Volunteer Box with ListView of draggable Cards and "Add" Button
          TileListField<Volunteer>(
            title: 'Volunteer',
            items: widget.resume.volunteer,
            dialogBuilder: (context, [Volunteer? volunteer]) {
              return VolunteerEditor(volunteer: volunteer);
            },
            itemBuilder: (context, volunteer) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(volunteer.organization,
                      style: const TextStyle(fontSize: 16)),
                  Text(volunteer.position,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),
          const SizedBox(height: 16.0),

          // Education Box with ListView of draggable Cards and "Add" Button
          TileListField<Education>(
            title: 'Education',
            items: widget.resume.education,
            dialogBuilder: (context, [Education? education]) {
              return EducationEditor(education: education);
            },
            itemBuilder: (context, education) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(education.institution,
                      style: const TextStyle(fontSize: 16)),
                  Text(education.studyType,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),
          const SizedBox(height: 16.0),

          // Awards Box with ListView of draggable Cards and "Add" Button
          TileListField<Award>(
            title: 'Awards',
            items: widget.resume.awards,
            dialogBuilder: (context, [Award? award]) {
              return AwardEditor(award: award);
            },
            itemBuilder: (context, award) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(award.title, style: const TextStyle(fontSize: 16)),
                  Text(award.awarder,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),
          const SizedBox(height: 16.0),

          // Publications Box with ListView of draggable Cards and "Add" Button
          TileListField<Publication>(
            title: 'Publications',
            items: widget.resume.publications,
            dialogBuilder: (context, [Publication? publication]) {
              return PublicationEditor(publication: publication);
            },
            itemBuilder: (context, publication) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(publication.name, style: const TextStyle(fontSize: 16)),
                  Text(publication.publisher,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),
          const SizedBox(height: 16.0),

          // Skills Box with ListView of draggable Cards and "Add" Button
          TileListField<Skill>(
            title: 'Skills',
            items: widget.resume.skills,
            dialogBuilder: (context, [Skill? skill]) {
              return SkillEditor(skill: skill);
            },
            itemBuilder: (context, skill) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(skill.name, style: const TextStyle(fontSize: 16)),
                  Text(skill.level,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),
          const SizedBox(height: 16.0),

          // Languages Box with ListView of draggable Cards and "Add" Button
          TileListField<Language>(
            title: 'Languages',
            items: widget.resume.languages,
            dialogBuilder: (context, [Language? language]) {
              return LanguageEditor(language: language);
            },
            itemBuilder: (context, language) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(language.language, style: const TextStyle(fontSize: 16)),
                  Text(language.fluency,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),

          // Interests Box with ListView of draggable Cards and "Add" Button
          TileListField<Interest>(
            title: 'Interests',
            items: widget.resume.interests,
            dialogBuilder: (context, [Interest? interest]) {
              return InterestEditor(interest: interest);
            },
            itemBuilder: (context, interest) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(interest.name, style: const TextStyle(fontSize: 16)),
                  Text(interest.keywords.join(', '),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),

          // References Box with ListView of draggable Cards and "Add" Button
          TileListField<Reference>(
            title: 'References',
            items: widget.resume.references,
            dialogBuilder: (context, [Reference? reference]) {
              return ReferenceEditor(reference: reference);
            },
            itemBuilder: (context, reference) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reference.name, style: const TextStyle(fontSize: 16)),
                  Text(reference.reference,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),

          // Projects Box with ListView of draggable Cards and "Add" Button
          TileListField<Project>(
            title: 'Projects',
            items: widget.resume.projects,
            dialogBuilder: (context, [Project? project]) {
              return ProjectEditor(project: project);
            },
            itemBuilder: (context, project) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(project.name, style: const TextStyle(fontSize: 16)),
                  Text(project.description,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProfileEditor extends StatefulWidget {
  final Profile? profile;

  const ProfileEditor({Key? key, this.profile}) : super(key: key);

  @override
  _ProfileEditorState createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final profile = widget.profile ?? Profile('', '', '');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: profile.network,
              onChanged: (value) => profile.network = value,
              decoration: const InputDecoration(
                labelText: 'Network',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: profile.username,
              onChanged: (value) => profile.username = value,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: profile.url,
              onChanged: (value) => profile.url = value,
              decoration: const InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class WorkEditor extends StatefulWidget {
  final Work? work;

  const WorkEditor({Key? key, this.work}) : super(key: key);

  @override
  _WorkEditorState createState() => _WorkEditorState();
}

class _WorkEditorState extends State<WorkEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final work = widget.work ?? Work('', '');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.name,
              onChanged: (value) => work.name = value,
              decoration: const InputDecoration(
                labelText: 'Company',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.position,
              onChanged: (value) => work.position = value,
              decoration: const InputDecoration(
                labelText: 'Position',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.url,
              onChanged: (value) => work.url = value,
              decoration: const InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.startDate,
              onChanged: (value) => work.startDate = value,
              decoration: const InputDecoration(
                labelText: 'Start Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.endDate,
              onChanged: (value) => work.endDate = value,
              decoration: const InputDecoration(
                labelText: 'End Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.summary,
              onChanged: (value) => work.summary = value,
              maxLines: 5,
              maxLength: 300,
              decoration: const InputDecoration(
                labelText: 'Summary',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            StringListField(title: 'Highlights', items: work.highlights),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class VolunteerEditor extends StatefulWidget {
  final Volunteer? volunteer;

  const VolunteerEditor({Key? key, this.volunteer}) : super(key: key);

  @override
  _VolunteerEditorState createState() => _VolunteerEditorState();
}

class _VolunteerEditorState extends State<VolunteerEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final volunteer = widget.volunteer ?? Volunteer('', '');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.organization,
              onChanged: (value) => volunteer.organization = value,
              decoration: const InputDecoration(
                labelText: 'Organization',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.position,
              onChanged: (value) => volunteer.position = value,
              decoration: const InputDecoration(
                labelText: 'Position',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.url,
              onChanged: (value) => volunteer.url = value,
              decoration: const InputDecoration(
                labelText: 'url',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.startDate,
              onChanged: (value) => volunteer.startDate = value,
              decoration: const InputDecoration(
                labelText: 'Start Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.endDate,
              onChanged: (value) => volunteer.endDate = value,
              decoration: const InputDecoration(
                labelText: 'End Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.summary,
              onChanged: (value) => volunteer.summary = value,
              maxLines: 5,
              maxLength: 300,
              decoration: const InputDecoration(
                labelText: 'Summary',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            StringListField(title: 'Highlights', items: volunteer.highlights),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class EducationEditor extends StatefulWidget {
  final Education? education;

  const EducationEditor({Key? key, this.education}) : super(key: key);

  @override
  _EducationEditorState createState() => _EducationEditorState();
}

class _EducationEditorState extends State<EducationEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final education = widget.education ?? Education('', '', '');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.institution,
              onChanged: (value) => education.institution = value,
              decoration: const InputDecoration(
                labelText: 'Institution',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.area,
              onChanged: (value) => education.area = value,
              decoration: const InputDecoration(
                labelText: 'Area',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.studyType,
              onChanged: (value) => education.studyType = value,
              decoration: const InputDecoration(
                labelText: 'Study Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.startDate,
              onChanged: (value) => education.startDate = value,
              decoration: const InputDecoration(
                labelText: 'Start Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.endDate,
              onChanged: (value) => education.endDate = value,
              decoration: const InputDecoration(
                labelText: 'End Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.score,
              onChanged: (value) => education.score = value,
              decoration: const InputDecoration(
                labelText: 'GPA',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            StringListField(title: 'Courses', items: education.courses),
          ],
        ),
      ),
    );
  }
}

class AwardEditor extends StatefulWidget {
  final Award? award;

  const AwardEditor({Key? key, this.award}) : super(key: key);

  @override
  _AwardEditorState createState() => _AwardEditorState();
}

class _AwardEditorState extends State<AwardEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final award = widget.award ?? Award('');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: award.title,
              onChanged: (value) => award.title = value,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: award.date,
              onChanged: (value) => award.date = value,
              decoration: const InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: award.awarder,
              onChanged: (value) => award.awarder = value,
              decoration: const InputDecoration(
                labelText: 'Awarder',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: award.summary,
              onChanged: (value) => award.summary = value,
              maxLines: 5,
              maxLength: 300,
              decoration: const InputDecoration(
                labelText: 'Summary',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class PublicationEditor extends StatefulWidget {
  final Publication? publication;

  const PublicationEditor({Key? key, this.publication}) : super(key: key);

  @override
  _PublicationEditorState createState() => _PublicationEditorState();
}

class _PublicationEditorState extends State<PublicationEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final publication = widget.publication ?? Publication('');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: publication.name,
              onChanged: (value) => publication.name = value,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: publication.publisher,
              onChanged: (value) => publication.publisher = value,
              decoration: const InputDecoration(
                labelText: 'Publisher',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: publication.releaseDate,
              onChanged: (value) => publication.releaseDate = value,
              decoration: const InputDecoration(
                labelText: 'Release Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: publication.url,
              onChanged: (value) => publication.url = value,
              decoration: const InputDecoration(
                labelText: 'url',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: publication.summary,
              onChanged: (value) => publication.summary = value,
              maxLines: 5,
              maxLength: 300,
              decoration: const InputDecoration(
                labelText: 'Summary',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class SkillEditor extends StatefulWidget {
  final Skill? skill;

  const SkillEditor({Key? key, this.skill}) : super(key: key);

  @override
  _SkillEditorState createState() => _SkillEditorState();
}

class _SkillEditorState extends State<SkillEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final skill = widget.skill ?? Skill('');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: skill.name,
              onChanged: (value) => skill.name = value,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: skill.level,
              onChanged: (value) => skill.level = value,
              decoration: const InputDecoration(
                labelText: 'Level',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            StringListField(title: 'Keywords', items: skill.keywords),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class LanguageEditor extends StatefulWidget {
  final Language? language;

  const LanguageEditor({Key? key, this.language}) : super(key: key);

  @override
  _LanguageEditorState createState() => _LanguageEditorState();
}

class _LanguageEditorState extends State<LanguageEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final language = widget.language ?? Language('');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: language.language,
              onChanged: (value) => language.language = value,
              decoration: const InputDecoration(
                labelText: 'Language',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: language.fluency,
              onChanged: (value) => language.fluency = value,
              decoration: const InputDecoration(
                labelText: 'Fluency',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class InterestEditor extends StatefulWidget {
  final Interest? interest;

  const InterestEditor({Key? key, this.interest}) : super(key: key);

  @override
  _InterestEditorState createState() => _InterestEditorState();
}

class _InterestEditorState extends State<InterestEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final interest = widget.interest ?? Interest('');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: interest.name,
              onChanged: (value) => interest.name = value,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            StringListField(title: 'Keywords', items: interest.keywords),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class ReferenceEditor extends StatefulWidget {
  final Reference? reference;

  const ReferenceEditor({Key? key, this.reference}) : super(key: key);

  @override
  _ReferenceEditorState createState() => _ReferenceEditorState();
}

class _ReferenceEditorState extends State<ReferenceEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final reference = widget.reference ?? Reference('', '');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: reference.name,
              onChanged: (value) => reference.name = value,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: reference.reference,
              onChanged: (value) => reference.reference = value,
              maxLines: 5,
              maxLength: 300,
              decoration: const InputDecoration(
                labelText: 'Reference',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class ProjectEditor extends StatefulWidget {
  final Project? project;

  const ProjectEditor({Key? key, this.project}) : super(key: key);

  @override
  _ProjectEditorState createState() => _ProjectEditorState();
}

class _ProjectEditorState extends State<ProjectEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final project = widget.project ?? Project('');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: project.name,
              onChanged: (value) => project.name = value,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: project.description,
              onChanged: (value) => project.description = value,
              maxLines: 5,
              maxLength: 300,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: project.startDate,
              onChanged: (value) => project.startDate = value,
              decoration: const InputDecoration(
                labelText: 'Start Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: project.endDate,
              onChanged: (value) => project.endDate = value,
              decoration: const InputDecoration(
                labelText: 'End Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: project.url,
              onChanged: (value) => project.url = value,
              decoration: const InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            StringListField(title: 'Roles', items: project.roles),
            const SizedBox(height: 16.0),
            StringListField(title: 'Highlights', items: project.highlights),
            const SizedBox(height: 16.0),
            StringListField(title: 'Keywords', items: project.keywords),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
