Function IIf($If, $Right, $Wrong) {If ($If) {$Right} Else {$Wrong}}
function query { param($q) return sfdx force:data:soql:query -q $q}
function push {return sfdx force:source:push}
function pull {return sfdx force:source:pull}
function open {param ($u) return sfdx force:org:open -p /lightning/page/home (IIf $u "-u$($u -Replace('\n',''))" "")} 
function openr {param ($u) return sfdx force:org:open -p /lightning/page/home -r (IIf $u "-u$($u -Replace('\n',''))" "")}
function create {return sfdx force:org:create -f config\project-scratch-def.json -w 10 $args}
function newclass {param ($classname) return sfdx force:apex:class:create -n $classname -d .\force-app\main\default\classes\ }
function newaura {param ($compname) return sfdx force:lightning:component:create -n $compname --type aura -d .\force-app\main\default\aura\ }
function newlwc {param ($compname) return sfdx force:lightning:component:create -n $compname --type lwc -d .\force-app\main\default\lwc\ }
function newtrigger {param($trname,$objname) return sfdx force:apex:trigger:create -n $trname -d .\force-app\main\default\triggers -s $objname -e "after insert"}
function stest {param($testclass) return sfdx force:apex:test:run -n $testclass -y -c -r human --wait 10}
function gco{param($branchname)git checkout $branchname}
function gcon{param($branchname)git checkout -b $branchname}
function gcleanall{git reset --hard HEAD; git clean -df}
function glog{git log --all --graph --decorate --format=medium | Out-GridView}
function orgs{sfdx force:org:list --all}
function aliases{sfdx force:alias:list}
[Net.ServicePointManager]::SecurityProtocol = "Tls12, Tls11"
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'