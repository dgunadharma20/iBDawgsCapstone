#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(plotly)
require(leaflet)

# Define UI for application that draws a histogram
dashboardPage( skin = "blue",
               dashboardHeader(title = "iBDawgs"),
               
               dashboardSidebar(
                 tags$head(tags$style(HTML('
                  .logo {
                    background-color: #2F4858 !important;
                  }
                  .navbar {
                    background-color: #2F4858 !important;
                  }
                  .main-header .logo {
                    background-color: #336699 !important;
                  }
                  .main-header .logo:hover {
                    background-color: #336699 !important;
                  }
                  .main-header .navbar {
                    background-color: #336699 !important;
                  }
                  .sidebar-menu .active a {
                    border-left-color: #336699 !important;
                  }
                  .skin-blue .sidebar-menu>li>a:focus {
                    border-left-color: #336699 !important;
                  }
                '))),
                 sidebarMenu(
                   menuItem("Introduction", 
                            tabName = "introduction", 
                            icon = icon("home")
                   ),
                   menuItem("Context",
                            tabName = "context",
                            icon = icon("")
                   ),
                   menuItem("Attack Types",
                            tabName = "types",
                            icon = icon("")
                   ),
                   menuItem("Network Traffic",
                            tabName = "data",
                            icon = icon("")
                   ),
                   menuItem("Feature Selection",
                            tabName = "feature",
                            icon = icon("")
                   ),
                   menuItem("ML Model",
                            tabName = "model",
                            icon = icon("")
                   ),
                   menuItem("Comparison",
                            tabName = "comparison",
                            icon = icon("")
                   ),
                   menuItem("Analysis Resulsts",
                            tabName = "results",
                            icon = icon("")
                   ),
                   menuItem("Business Values",
                            tabName = "business",
                            icon = icon("")
                   )
                )
               ),
               
               
               dashboardBody(
                 tags$h1(tags$style(HTML("
                  .main-header .logo {
                      font-family: 'Gill Sans', sans-serif;
                      font-weight: bold;
                      font-size: 16px;
                  }
                    
                  body {
                    font-family: 'Gill Sans', sans-serif;
                    font-size: 16px;
                  }
                  
                  h1 {
                    font-family: 'Gill Sans', sans-serif;
                    font-weight: bold;
                    font-size: 32px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 16px;
                    margin-bottom: 8x;
                  }
                  
                  h2 {
                    font-family: 'Gill Sans', sans-serif;
                    font-weight: bold;
                    font-size: 26px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 16px;
                    margin-bottom: 8x;
                  }
                  
                  h3 {
                    font-family: 'Gill Sans', sans-serif;
                    font-weight: bold;
                    font-size: 22px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 16px;
                    margin-bottom: 8x;
                  }
                  
                  p {
                    font-family: 'Gill Sans', sans-serif;
                    font-style: normal;
                    font-size: 16px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 8px;
                    margin-bottom: 16px;
                  }
                  
                  h5 {
                    font-family: 'Gill Sans', sans-serif;
                    font-weight: bold;
                    font-style: normal;
                    font-size: 16px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 8px;
                    margin-bottom: 16px;
                  }
                  
                  h6 {
                    font-family: 'Gill Sans', sans-serif;
                    font-style: italic;
                    font-size: 16px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 8px;
                    margin-bottom: 16px;
                  }
                  
                  .box{
                    border-top-color:#ffffff;
                  }
                  
                  .selectize-input {
                    margin-left: 16px !important;
                  }
                  
                  .selectize-dropdown {
                    margin-left: 16px !important;
                  }
                  
                  .input-daterange {
                    margin-left: 16px !important;
                  }
                  
                  label {
                    margin-left: 16px !important;
                  }
                  
                  img {
                    display: block; 
                    margin-left: auto; 
                    margin-right: auto;
                  }
                  
                 "))),
                 tabItems(
                   tabItem("introduction",
                           fluidPage(
                             fluidRow(
                               box(
                                 width = 12,
                                 h1("iBDawgs Visualization Dashboard - Unauthorized Access"),
                                 p("Aaron Liu (Data Analyst), 
                                    Brian Park (Data Scientist), 
                                    Bryan Bernardi (Cybersecurity Analyst), 
                                    Darren Gunadharma (Front-End), 
                                    Jonathan Bryan Prasetyo (Product Manager)")
                                 
                               )
                             ),
                             fluidRow(
                               box(width = 12,
                                 h2("Our Team"),
                                 p("iBDawgs is a team of skilled software developers and cybersecurity analysts dedicated to making the digital world a safer place. 
                                   At iBDawgs, we understand the critical importance of cybersecurity in today's digital landscape. Malicious cyber attacks can have 
                                   devastating consequences for both individuals and organizations, and we are committed to developing innovative solutions that can 
                                   help prevent these attacks from happening. With a focus on machine learning, iBDawgs is working to develop a powerful machine 
                                   learning model to combat various malicious cyber-attacks.")
                               )
                             ),
                             fluidRow(
                               box(width = 6,
                                 h2("Our Vision"),
                                 p("Our vision at iBDawgs is to become a leading provider of machine learning solutions for cybersecurity. 
                                   We strive to deliver effective and innovative tools that can protect individuals and organizations from 
                                   the ever-evolving threats of cyber-attacks. We envision a world where everyone can confidently use web-based 
                                   service applications without the fear of unauthorized access, and we are dedicated to making this vision a reality."),
                                 br(),
                                 h2("Our Mission"),
                                 p("Our mission at iBDawgs is to improve the security and privacy of web-based service applications through prevention of 
                                   unauthorized access, using innovative solutions that leverage machine learning. We are committed to protecting individuals 
                                   and organizations from the devastating consequences of cyber-attacks.")
                                 
                               ),
                               box(width = 6,
                                 h2("What is Unauthorized Access?"),
                                 p("Unauthorized access refers to when someone gains entry to a computer network, website, program service, server, or other resources without authorization. 
                                   One way unauthorized parties might gain access to your application are through malicious cyber-attacks."),
                                 br(),
                                 h2("Importance of Unauthorized Access"),
                                 p("Malicious cyber-attacks are still a current and ongoing problem. In fact, the threat of cyber-attacks has been increasing in recent years, with attackers 
                                   becoming more sophisticated and organized in their methods. Cyber attacks can have serious consequences for individuals and businesses, ranging from identity 
                                   theft, financial losses, reputational damage, to loss of intellectual property and sensitive data.")
                               )
                             )
                           )),
                   tabItem("context",
                           
                           fluidPage(
                             fluidRow(
                               box(
                                 width = 12,
                                 h2("Context and Real-Life Examples"),
                                 p("")
                             )),
                             fluidRow(
                               box(width = 12,
                                   h3("Dyn - Mirai Botnet (2016)"),
                                   p("In October 2016, a DDoS attack was launched against the popular DNS service provider Dyn. The massive attack crashed Dyn’s servers, causing disruption to several 
                                     major websites such as Twitter, Reddit and Netflix. The attack was carried out by botnet, a network of computers infected with malware and used by the attackers to 
                                     cause huge volumes of traffic to Dyn’s servers. Experts estimate that the loss incurred from this incident may come up to $110 million towards the companies affected. "))
                             ),
                             fluidRow(
                               box(width = 12,
                                   h3("A.P. Moller-Maersk - NotPetya (2017)"),
                                   p("In June 2017, the major shipping corporation Maersk suffered substantial disruption and monetary losses as a result of the WannaCry ransomware outbreak. Due to the attack, 
                                     Maersk was unable to complete customer orders for several days, which resulted in lost sales for the corporation. In addition to the financial damage, Maersk also had to pay 
                                     a sizable amount to fix the security flaws that the attackers exploited and restore its IT systems. Overall, Maersk estimates that the web attack has cost the company around 
                                     $200 to $300 million. The WannaCry attack brings to light the potential harm that cyberattacks could do to businesses and emphasizes the significance of strong cybersecurity 
                                     measures and contingency preparation."))
                             )
                           )),
                   tabItem("types",
                           fluidPage(
                             fluidRow(
                               box(
                                 width = 12,
                                 h2("DDoS Attack Types"),
                                 p("")
                               )),
                             fluidRow(
                               box(width = 12,
                                   h3("DDoS"),
                                   p("Distributed Denial of Service is an attack in which multiple systems flood a targeted server or network with traffic, overwhelming it and causing it to stop responding to 
                                     legitimate requests."),
                                   br(),
                                   h3("DDoS GoldenEye"),
                                   p("A type of DoS attack that uses a low-and-slow approach, meaning it sends small amounts of traffic at a slow rate to a target server or website. This makes it difficult for 
                                     the target to distinguish between legitimate traffic and malicious traffic, ultimately leading to a denial of service."),
                                   br(),
                                   h3("DDoS Hulk"),
                                   p("A type of DoS attack that uses a high-and-fast approach, meaning it sends a large volume of traffic to a target server or website in a short period of time. This overwhelming
                                     traffic also leads to a denial of service."),
                                   br(),
                                   h3("DDoS Slowhttptest"),
                                   p("A type of DoS attack that takes advantage of a vulnerability in the HTTP protocol. It sends incomplete HTTP requests to a server or website, keeping the connection open and 
                                   tying up server resources until the connection times out."),
                                   br(),
                                   h3("DDoS slowloris"),
                                   p("A type of DoS attack that also exploits a vulnerability in the HTTP protocol. It sends incomplete HTTP requests to a server or website, but instead of keeping the connection open, 
                                     it sends more incomplete requests, gradually tying up the server resources."),
                                   br()
                               )
                             ),
                             fluidRow(
                               box(width = 12,
                                   plotlyOutput("ddosChart")
                               )
                             ),
                             fluidRow(
                               box(width = 12,
                                   plotlyOutput("ddosPie")
                               )
                             )
                           )),
                   tabItem("data",
                           fluidPage(
                             fluidRow(
                               box(
                                 width = 12,
                                 h2("Network Traffic Data"),
                                 p("")
                               )),
                             fluidRow(
                               box(width = 12,
                                   h3("Distribution of BENIGN IP Addresses"),
                                   leafletOutput("benignMap"),
                                   p("Based on the dataset available in the map, it is possible to make an inference regarding the geographic distribution of benign IP addresses. However, it is important to note that the dataset is limited and may not be 
                                     representative of the entire IP address space. Further analysis and validation using a larger and more diverse dataset would be necessary to draw more accurate conclusions regarding IP address usage patterns in different 
                                     regions. In the cybersecurity domain, such analysis can help in identifying potential threats and vulnerabilities in different geographic locations and inform risk management strategies.")
                               ))
                           )),
                   tabItem("feature",
                           fluidPage(
                             fluidRow(
                               box(
                                 width = 12,
                                 h2("Feature Selection"),
                                 p("The datasets that our team has been using includes a total of 79 feautres, thus, we need to select certain features that best
                                   correlates with determing the label of malicious acitivty."),
                                 p("Feature selection helps in reducing noise and redundancy in high-dimensional data."),
                                 br(),
                                 h3("Boruta Algorithm"),
                                 p("Boruta algorithm is a wrapper method that uses random forest classification to find the most important features in a dataset with respect to an outcome variable."),
                                 p("Boruta algorithm duplicates the dataset, shuffles the values in each column to create shadow features, trains a classifier, and checks if real features have higher importance than their shadow features."),
                                 p("The algorithm continues to iterate until a predefined set of iterations or until all the features have been confirmed or rejected as important."),
                                 p("Boruta algorithm is useful as it is a robust feature selection method that validates the importance of a feature by comparing it with random shuffled copies."),
                                 p("We should use the Boruta algorithm for feature selection because it is a robust and efficient method to extract the most important features from a dataset with 
                                   respect to an outcome variable. It uses a top-down search approach that compares the original attributes' importance with the importance achievable at random, 
                                   estimated using their permuted copies. This increases the robustness of the method and ensures that only the most important and relevant features are selected. 
                                   Moreover, the algorithm is flexible and can handle non-normal data without the need for data transformation. By selecting only the most important features, we 
                                   can train a model faster, reduce its complexity, make it easier to interpret, and improve its accuracy, precision or recall, whatever may the performance metric 
                                   be.")
                               )),
                             fluidRow(
                               box(width = 12,
                                   plotlyOutput("top20BarChart")
                                   )
                             ),
                             fluidRow(
                               box(width = 12,
                                   h3(""),
                                   p("When working with a categorical variable, a random classifier can be used as a baseline model to assess the performance of other classifiers. Since a categorical variable has a limited number of discrete values or 
                                   categories, a random classifier can assign labels to instances with the same probability for each category. This means that the expected accuracy of a random classifier for a balanced dataset with k classes is 1/k. Therefore, 
                                     a random classifier is a useful tool to establish a baseline performance metric for classification tasks, particularly when working with categorical variables."))
                             ),
                             fluidRow(
                               box(width = 12,
                                   h3("Features"),
                                   br(),
                                   h5("Destination Port"),
                                   p("The destination port number of the network traffic is important for identifying the type of application or service that is being used, which can help in identifying potential security threats."),
                                   h5("Flow Duration"),
                                   p("The duration of the flow can help in identifying long-running connections, which could be indicative of certain types of attacks or suspicious activity."),
                                   h5("Total Fwd Packets | Total Backward Packets"),
                                   p("These features represent the total number of packets in the forward and backward directions, respectively. They can be useful in identifying different types of network attacks such as DDoS or port scanning."),
                                   h5("Total Length of Fwd Packets | Total Length of Bwd Packets"),
                                   p("These features represent the total length of packets in the forward and backward directions, respectively. They can be used to identify large data transfers or exfiltration attempts."),
                                   h5("Fwd Packet Length Max | Fwd Packet Length Min"),
                                   p("These features represent the maximum and minimum length of forward packets in the flow. The distribution of packet lengths can be used to identify specific types of attacks, such as buffer overflow or data injection."),
                                   h5("Fwd Packet Length Mean | Fwd Packet Length Std"),
                                   p("These features represent the mean and standard deviation of forward packet lengths in the flow. These statistics can be used to identify outliers and anomalies in the packet length distribution."),
                                   h5("Flow Bytes/s | Flow Packets/s"),
                                   p("These features represent the average number of bytes and packets per second in the flow. They can be used to identify abnormal network activity and potential security threats."),
                                   h5("Flow IAT Mean | Flow IAT Std | Flow IAT Max | Flow IAT Min"),
                                   p("These features represent the mean, standard deviation, maximum, and minimum inter-arrival time between packets in the flow. They can identify different types of network attacks, such as port scanning and DoS attacks."),
                                   h5("Fwd IAT Total | Fwd IAT Mean | Fwd IAT Std | Fwd IAT Max | Fwd IAT Min"),
                                   p("These features represent the total, mean, standard deviation, maximum, and minimum inter-arrival time between forward packets in the flow. These statistics can be used to identify unusual patterns in network traffic."),
                                   h5("Bwd IAT Total | Bwd IAT Mean | Bwd IAT Std | Bwd IAT Max | Bwd IAT Min"),
                                   p("These features represent the total, mean, standard deviation, maximum, and minimum inter-arrival time between backward packets in the flow. These statistics can be used to identify unusual patterns in network traffic."),
                                   h5("Fwd PSH Flags | Bwd PSH Flags | Fwd URG Flags | Bwd URG Flag"),
                                   p("These features represent the presence of specific TCP flags in the forward and backward directions. These flags can be used to identify different types of network attacks, such as data injection and DoS attacks."),
                                   h5("Fwd Header Length | Bwd Header Length"),
                                   p("These features represent the total length of the headers in the forward and backward directions. They can be used to identify different types of network attacks, such as packet fragmentation and injection attacks."),
                                   h5("Min Packet Length | Max Packet Length | Packet Length Mean | Packet Length Std"),
                                   p("These features represent the minimum, maximum, mean, and standard deviation of packet lengths in the flow. They can be used to identify anomalies in the packet length distribution and potential security threats."),
                                   h5("FIN Flag Count | SYN Flag Count | RST Flag Count | PSH Flag Count | ACK Flag Count | URG Flag Count | CWE Flag Count | ECE Flag Count"),
                                   p("These features represent the count of specific TCP flags")
                                   
                               )
                             )
                           )),
                   tabItem("comparison",
                           fluidPage(
                             fluidRow(
                               box(
                                 width = 12,
                                 h2("Model Comparison")
                               )),
                             fluidRow(
                               box(width = 4,
                                   h3("Select Model"),
                                   uiOutput("selectModel1")),
                               box(width = 8,
                                   h3("Is the Model Overfitting?"),
                                   imageOutput("modelChartImg"))
                             )
                           )),
                   tabItem("model",
                           fluidPage(
                             fluidRow(
                               box(
                                 width = 12,
                                 h2("Machine Learning Model")
                                )),
                             fluidRow(
                               box(width = 4,
                                   h3("Select Model"),
                                   uiOutput("selectModel2")),
                               box(width = 8,
                                   h3("Model Scores"),
                                   textOutput("modelScoreText"),
                                   tags$style(type="text/css", "#modelScoreText {white-space: pre-wrap;}"))
                             )
                           )),
                   tabItem("results",
                           fluidPage(
                             fluidRow(
                               box(width = 12)
                             ),
                             fluidRow(
                               box(width = 12)
                             )
                           )),
                   tabItem("business",
                           fluidPage(
                             fluidRow(
                               box(width = 12)
                             ),
                             fluidRow(
                               box(width = 12)
                             )
                           ))
                 )
               )
)