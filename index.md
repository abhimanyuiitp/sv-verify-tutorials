---
layout: home
author_profile: true
---

## Welcome to SV Verify Tutorials

Learn SystemVerilog verification through comprehensive lessons and hands-on labs.

### Lessons

{% for lesson in site.lessons %}
- [{{ lesson.title }}]({{ lesson.url | relative_url }})
{% endfor %}

### Labs

{% for lab in site.labs %}
- [{{ lab.title }}]({{ lab.url | relative_url }})
{% endfor %}
