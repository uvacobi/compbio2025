---
layout: default
title: "welcome"
---

## Course information

{% assign course = site.data.course_information.course %}
{% assign ilist = "" %}
{% capture ilist %}{% for i in course.instructors -%}
  +{% if i.url != "" and i.url != null %}<a href="{{i.url}}">{{i.name}}</a>{% else %}{{i.name}}
  {% endif %} 
  {%- endfor %}{% endcapture %}



<div class="container">
  <div class="row align-items-baseline">
    <div class="col-2 text-end fs-5">Course:</div>
    <div class="col-6">{{ course.number }}: {{ course.title }}</div>
</div>
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Term:</div>
    <div class="col-6">{{ course.term }}</div>
  </div>
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Instructors:</div>
    <div class="col-6 ">{{ ilist | remove_first: "+"| split: "+" | array_to_sentence_string: '' }}</div>
  </div>  
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Times:</div>
    <div class="col-6 ">{{ course.times }}</div>
  </div>
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Location:</div>
    <div class="col-6 ">{{ course.location }}</div>
  </div>
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Description:</div>
    <div class="col-10 ">{{ course.description }}</div>
  </div>
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Grading:</div>
    <div class="col-10 ">
      <ul>
        <li>Homework assignments - 75% (6 assignments per module)</li>
        <li>Quizzes - 25% (6 quizzes per module, lowest score dropped)</li>
      </ul>
    </div>
  </div>   
</div>

## Lectures

Resources include both required reading as well as additional secondary sources for your own follow-up. The (<span style="color:red">!!</span>) icon indicates required reading; all other sources are secondary.

<table class="table">
  <thead>
    <tr>
      <th scope="col" width="2%">#</th>
      <th scope="col" width="3%">Date</th>
      <th scope="col" width="35%">General topic</th>
      <th scope="col" width="15%">Instructor</th>
      <th scope="col" width="25%">Resources</th>
      <th scope="col" width="15%">Assignments/Quizzes</th>
    </tr>
  </thead>
  <tbody>
    {% for l in site.data.lectures.lectures %}
    {% if l.section != null and l.section != current_section %}
    {% assign current_section = l.section %}
    <tr>
      <th colspan="6" class="bg-secondary"><h3 class="text-light">{{ current_section }}</h3></th>
    </tr>
    {% endif %}
    <tr>
      <th scope="row">{{ forloop.index }}</th>
      <td>{{ l.date }}</td>
      <td><h5 class="">{{ l.topic }}</h5><span class="text-secondary">{{ l.details }}</span></td>
      <td>{{ l.instructor }}</td>
      <td>
        {% if r.links != "" %}<ul class="m-0 p-0">{% for r in l.links %}{% if r.url != "" and r.url != null %}
          <li class="text-secondary">{% if r.required %} <span style="color:red">!!</span> {% endif %}<a href="{{ r.url }}">{{r.title}}</a></li>{% endif %}{% endfor %}</ul>{% endif %}
      </td>
      <td>{% if r.assignments != "" %}<ul class="m-0 p-0">{% for r in l.assignments %}
          <li class="text-secondary">{% if r.url != "" and r.url != null %}<a href="{{ r.url }}">{{r.title}}</a>{% else %}{{r.title}}{% endif %}</li>{% endfor %}</ul>{% endif %}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

## Class participation

Students are expected to attend class. There is no textbook, but each lecture will have reading material posted. Students should read the lecture material before the lecture. You should plan to invest roughly 3 hours per week on reading the posted outside material. Quizzes are there to convince you to prepare for the lectures. The lectures will be most useful if you do the reading before the accompanying lecture so that you can come prepared with some background to ask questions.

## Quizzes

Each week will start with a short (5-10 minute) quiz. The quiz will cover 1. The content of the preparatory reading material for the current week; and 2. The content from the lecture and lab component from the previous week. Quizzes are done individually, so you should not consult with outside help (web sites, AI, classmates) during the quizzes.

## Assignments

Each module includes 6 homework assignments. These assignments will include programming, theoretical problems, and data analysis. Each assignment is worth 12.5% of the final grade for the module. The assignments will be assigned each week, and will be due one week later.

### Collaboration and AI on assignments

We encourage using whatever tools will help you learn best, including each other or external AI. However, you will learn most if you sincerely attempt the lessons on your own before seeking outside help. Therefore, we expect you to give a sincere attempt on all assignments individually. We expect that you will use external resources (each other, AI, etc) to answer specific questions after you have attempted them on your own. Do not simply copy solutions to assignments from classmates or AI.

<!-- Students should complete assignments individually. We want you to work together at the level of sharing ideas, concepts, or suggested functions or reading material. You should not share or seek out completed solutions to the assignments. -->

### Late assignments

All assignments are due one week later. Please turn in your assignments on time. It is easier for the instructor to grade assignments all at once, and turning in assignments late will get you behind because you will already have another assignment. Nevertheless, because we know sometimes things are busy, all assignments will have a one week grace period after the deadline in which you may turn them in without penalty. But to encourage you to complete the assignments in a reasonable timeframe, any assignment turned in more than a week after the posted deadline will incur a 50% penalty.

## Office hours

Given the diversity of instructors in the course, we do not plan to hold regular office hours, but students should feel free to reach out to any instructor via e-mail to schedule a meeting. We will be available to meet individually with students as needed. We are also often available for a few minutes after class.

## Missing lectures

If you need to miss a lecture, we will address it on a case-by-case basis. Contact the instructor of the lecture you need to miss, who will suggest any materials you should review for that unit. All the lectures are also posted, so you can go through them on your own. Your lowest quiz score in each module will be dropped automatically to accommodate absences. Please try not to miss more than one quiz per module.

## Recordings

We do not intend to record or broadcast lectures.
