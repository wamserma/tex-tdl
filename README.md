[![Build Status](https://img.shields.io/travis/wamserma/tex-tdl/master.png)](https://travis-ci.org/wamserma/tex-tdl/) ![translation to 22 languages available](https://img.shields.io/badge/languages-22-blue.svg)

# tex-tdl
a simple template for paper-based ToDo-Lists

## Usage (Code)

0. clone repository `https://github.com/wamserma/tex-tdl.git`
0. edit `config.tex`
0. run `pdflatex tdl` (twice) or `xelatex tdl` (if not using a Latin-based locale, run also twice).

Depending on your language (e.g. Japanese) you might also want to bring your own font. Just replace `sourcesanspro` in `tdl.cls`.

## Usage (ToDo-System)

Managing your ToDo-Lists with a computer is very convenient. But it has a huge drawback: Access time. Even if you have your phone/tablet/PC always on, opening your software takes a few seconds. Nothing beats pen and paper for access time. Personally, I usually have a great idea once I turned all my devices off for bed time. Scribbling down notes in some notebook might help, but then you have to think again, when you sinc paper and software. Or maybe you like to turn of your stuff once in a while to work concentrated. I made this template for all these use cases. Inspiration struck me, when I read the [free One-Minute ToDo-List book](http://www.michaellinenberger.com/free1MTD.htm). It is not rocket science, but a good starter if you need some ToDo-Management. Ignore the parts of the book on Outlook and Toodledo unless you are already using this software. The rules in the book are quite flexible when it comes to realisation, which is something I like once you had some experience with managing ToDo-Lists. My personal point of view is that you need a handful of strict rules to get you started. After a while you will subconciously bend the rules to your needs anyway. Enough of the babbling, let's dive straight in.

## (TL;DR)

(There is no long version, but I knew you were looking for this section.)

### The days' lists

Everything that goes here must be finished on the given day. Each day's field is to be filled on the day before. Do not put more than three items per day. Always write your tasks in a next action style: "print fresh tdl-sheets" instead of "new tdl-sheets needed".
If you've done your day's task pick sth. from the weeks' list.
The last task for your day is always the same and therefore not explicitly written down: Pick the three most important tasks for the next day.

### The weeks' lists

Put everything here that needs to be done within the next 7-10 days. It should not carry more than 20 items. Everything else goes to the next list.
Review this list at least once during the week. Second last task of your week is to prepare this list for the upcoming week.

### The backlog

Put everything here that can wait at least 7-10 days. This list may grow arbitrarily long. You may want to split in two parts: Stuff with a fixed deadline and stuff without. Review this list once when creating the list for the upcoming week.
There is one backlog sheet (two for double sided printing) for every four weeks. Feel free to move them around as you need. (You might want to put the 'active' backlog after the current week.)

### Incoming tasks

Whenever a task comes in that needs more than 2 minutes or would disrupt you from your current task, put it in the week's list. Even if it is a super critical task, you may move it only to the current day's list, if there is room. You can always push back a task from the day's list to the week's list. 

### The weeks' goals

Put some checkable outcomes for your week here. This should not be single tasks but rather help you to avoid missing a task. The outcome "flat cleaned" is easily checkable and you will know whether you forgot to "empty the trash can".

### The notes field

This field is for notes related to that week: phone-numbers you need for your tasks, planning hints ("expect a lot of support calls this week") and so on.

### Hints for reviewing/filing tasks

+ Review your lists from bottom up. The newest tasks are usually more important than tasks that have lingered for a while.
+ File tasks by start date. If you know a task can only be done after a given date (e.g. "grade exams"), put it in the weekly field of the corresponding week.
+ If you have tasks that repeatedly come up and consist of the same subtasks, make your own Sub-ToDo-List and put it between the sheets of this list. This spares you of thinking about the subtasks each time this big task comes up.
