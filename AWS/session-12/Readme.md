in default vpc
create launch template
Autoscaling group

creating group and adding instances
create taget group


to generate load use some commands
how to loop url in shell script

create load balancer
now create ALB

internal-private
internet-facing: public
we have to select at least 2 azs
listeners - http:80 : target(if someone is hitting port 80 then forward traffic to this target group)

ALB-Listeners-rule-add rule-team-condition path(if path is /ui.html then target is select target group uo team)
one listeners have  multiple rules
edit default rule return fixed response 200 default msg from project-a

take LB url and hit on web
and try with /ui.html
/index.html

go to server and add
cd /usr/share/nginx/html
echo "Hi" > ui.html

go to server and add
cd /usr/share/nginx/html
echo "Hello" > ui.html

-----------------------------------
create sg 