#!/usr/bin/env groovy
/**
*
*/
// vars/sayHello.groovy
def call(body) {

  // evaluate the body block, and collect configuration into the object
  def config = [:]
  body.resolveStrategy = Closure.DELEGATE_FIRST
  body.delegate = config
  body()
  println $config
  println config
  print ${config}
  def path = config.srcDir
  def dockerfile = "Dockerfile"
  def pathDir="./"
  if(config.srcDir!=""){
    path="./${config.srcDir}/"
    pathDir="./${config.srcDir}/"
  }
  if(env.JOB_NAME.contains('DockerimageBuild'))
  {
    sh("docker build -f Dockerfile -t subhash403/${config.appName}:${config.version}")
  }
  else
  {
    sh("docker build -f ${path}Dockerfile --build-arg TARGET_PATH=${config.targetPath} -t charter/${config.appName}:${config.version} ${pathDir}")
  }
}
