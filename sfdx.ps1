function query { param($sQuery) return sfdx force:data:soql:query -q $sQuery}
function push {return sfdx force:source:push}
function pull {return sfdx force:source:pull}
function open {return sfdx force:org:open -p one/one.app#/home}
function create {return sfdx force:org:create -f config\project-scratch-def.json -w 10 $args}
function newclass {param ($classname) return sfdx force:apex:class:create -n $classname -d .\force-app\main\default\classes}
function newtrigger {param($trname,$objname) return sfdx force:apex:trigger:create -n $trname -d .\force-app\main\default\triggers -s $objname -e "after insert"}
function stest {param($testclass) return sfdx force:apex:test:run -n $testclass -y -c -r human --wait 10}
function gco{param($branchname)git checkout $branchname}
function gcon{param($branchname)git checkout -b $branchname}
function gcleanall{git reset --hard HEAD; git clean -df}
function glog{git log --all --graph --decorate --format=medium | Out-GridView}