require 'jar_dependencies'
JBUNDLER_LOCAL_REPO = Jars.home
JBUNDLER_JRUBY_CLASSPATH = []
JBUNDLER_JRUBY_CLASSPATH.freeze
JBUNDLER_TEST_CLASSPATH = []
JBUNDLER_TEST_CLASSPATH.freeze
JBUNDLER_CLASSPATH = []
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/org/eclipse/jgit/org.eclipse.jgit/3.4.1.201406201815-r/org.eclipse.jgit-3.4.1.201406201815-r.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/com/jcraft/jsch/0.1.50/jsch-0.1.50.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/com/googlecode/javaewah/JavaEWAH/0.7.9/JavaEWAH-0.7.9.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/org/apache/httpcomponents/httpclient/4.1.3/httpclient-4.1.3.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/org/apache/httpcomponents/httpcore/4.1.4/httpcore-4.1.4.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/commons-logging/commons-logging/1.1.1/commons-logging-1.1.1.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/commons-codec/commons-codec/1.4/commons-codec-1.4.jar')
JBUNDLER_CLASSPATH.freeze
