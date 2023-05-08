import 'package:flutter/material.dart';
import 'package:synapse/resume.dart' as resume;

class ResumesSection extends StatefulWidget {
  const ResumesSection({Key? key}) : super(key: key);

  @override
  State<ResumesSection> createState() => _ResumesSectionState();
}

class _ResumesSectionState extends State<ResumesSection> {
  List<resume.Resume> resumes = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text('Resume $index'),
            subtitle: Text('Resume $index'),
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
