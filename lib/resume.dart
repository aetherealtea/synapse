import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Resume {
  // Class replicates jsonresume-based schema and offers constructor and json serialization
  String resumeId; // id of resume
  String resumeName; // name of resume

  String name = '';
  String label = '';
  String picture = '';
  String email = '';
  String phone = '';
  String website = '';
  String summary = '';
  String location = '';
  List<Work> work = [];
  List<Education> education = [];
  List<Skill> skills = [];
  List<Language> languages = [];
  List<Interest> interests = [];
  List<Reference> references = [];

  Resume({String? resumeId, String resumeName = ''})
      : resumeId = resumeId ?? const Uuid().v4(),
        resumeName = resumeName.isEmpty ? 'New resume' : resumeName;

  factory Resume.fromJson(Map<String, dynamic> json) {
    return Resume(resumeId: json['id'], resumeName: json['name'])
      ..name = json['basics']['name']
      ..label = json['basics']['label']
      ..picture = json['basics']['picture']
      ..email = json['basics']['email']
      ..phone = json['basics']['phone']
      ..website = json['basics']['url']
      ..summary = json['basics']['summary']
      ..location = json['basics']['location']
      ..work = json['work']
      ..education = json['education']
      ..skills = json['skills']
      ..languages = json['languages']
      ..interests = json['interests']
      ..references = json['references'];
  }

  Map<String, dynamic> toJson() => {
        'resumeId': resumeId,
        'resumeName': resumeName,
        'basics': {
          'name': name,
          'label': label,
          'picture': picture,
          'email': email,
          'phone': phone,
          'website': website,
          'summary': summary,
          'location': location
        },
        'work': work,
        'education': education,
        'skills': skills,
        'languages': languages,
        'interests': interests,
        'references': references
      };
}

class Work {
  String company;
  String position;
  String website = '';
  String startDate = '';
  String endDate = '';
  String summary = '';
  List<String> highlights = [];

  Work(this.company, this.position);

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(json['company'], json['position'])
      ..website = json['website']
      ..startDate = json['startDate']
      ..endDate = json['endDate']
      ..summary = json['summary']
      ..highlights = json['highlights'];
  }

  Map<String, dynamic> toJson() => {
        'company': company,
        'position': position,
        'website': website,
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
  String startDate = '';
  String endDate = '';
  String gpa = '';
  List<String> courses = [];

  Education(this.institution, this.area, this.studyType);

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(json['institution'], json['area'], json['studyType'])
      ..startDate = json['startDate']
      ..endDate = json['endDate']
      ..gpa = json['gpa']
      ..courses = json['courses'];
  }

  Map<String, dynamic> toJson() => {
        'institution': institution,
        'area': area,
        'studyType': studyType,
        'startDate': startDate,
        'endDate': endDate,
        'gpa': gpa,
        'courses': courses
      };
}

class Skill {
  String name;
  String level = '';
  List<String> keywords = [];

  Skill(this.name);

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(json['name'])
      ..level = json['level']
      ..keywords = json['keywords'];
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
    return Interest(json['name'])..keywords = json['keywords'];
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

// Widgets
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
      )),
      body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              initialValue: widget.resume.name,
              onSaved: (value) => widget.resume.name = value ?? '',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Label'),
              initialValue: widget.resume.label,
              onSaved: (value) => widget.resume.label = value ?? '',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Picture'),
              initialValue: widget.resume.picture,
              onSaved: (value) => widget.resume.picture = value ?? '',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              initialValue: widget.resume.email,
              onSaved: (value) => widget.resume.email = value ?? '',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone'),
              initialValue: widget.resume.phone,
              onSaved: (value) => widget.resume.phone = value ?? '',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Website'),
              initialValue: widget.resume.website,
              onSaved: (value) => widget.resume.website = value ?? '',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Summary'),
              initialValue: widget.resume.summary,
              onSaved: (value) => widget.resume.summary = value ?? '',
            )
          ])),
    );
  }
}
