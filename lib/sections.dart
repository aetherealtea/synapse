import 'package:flutter/material.dart';
import 'package:synapse/resume.dart';

import 'dart:convert';
import 'dart:io';

class ResumesSection extends StatefulWidget {
  const ResumesSection({Key? key}) : super(key: key);

  @override
  State<ResumesSection> createState() => _ResumesSectionState();
}

class _ResumesSectionState extends State<ResumesSection> {
  List<Resume> resumes = [];

  @override
  void initState() {
    super.initState();
    _loadResumes();
  }

  void _loadResumes() async {
    final file = File('data/resumes.json');
    final json = jsonDecode(await file.readAsString());
    setState(() {
      resumes = json.map<Resume>((e) => Resume.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: resumes.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(resumes[index].resumeName),
            subtitle: Text(resumes[index].resumeId),
            trailing: Icon(Icons.more_vert),
          ),
        );
      },
    ));
  }
}

class ApplicationsSection extends StatelessWidget {
  const ApplicationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text('Application $index'),
            subtitle: Text('Application $index'),
            trailing: Icon(Icons.more_vert),
          ),
        );
      },
    ));
  }
}

class InsightsSection extends StatelessWidget {
  const InsightsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text('Insight $index'),
            subtitle: Text('Insight $index'),
            trailing: Icon(Icons.more_vert),
          ),
        );
      },
    ));
  }
}
