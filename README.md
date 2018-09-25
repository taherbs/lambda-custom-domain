# Custom domain name for Lambda
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/taherbs/lambda-custom-domain/master/LICENSE)

With Serverless, it's easier than ever to deploy production-ready API endpoints. However, using AWS API Gateway results in odd hostnames for your endpoints. Further, these hostnames will change if you remove and redeploy your service, which can cause problems for existing clients.

This project will help you set-up a mapping between custom domain name to your serverless endpoint.

### Prerequisites:
* [serverless](https://serverless.com/framework/docs/getting-started/)
* [serverless-domain-manager](https://github.com/amplify-education/serverless-domain-manager)
* [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)
* [sceptre](https://sceptre.cloudreach.com/latest/)

### Quick Start

[Watch the video guide here](https://serverless.com/framework/) or follow the steps below to create and deploy your first serverless microservice in minutes.

1. **Install serverless and serverless-domain-manager via npm:**

  ```bash
  # Install serverless 
  npm install -g serverless
  # Install serverless-domain-manager
  npm install serverless-domain-manager --save-dev
  ```

2. **Set-up your Provider Credentials**. 
	
  [Watch the video on setting up credentials](https://www.youtube.com/watch?v=HSd9uYj2LJA)

3. **Create DNS ZONE and Certificate**

  Update the [config.yaml](./aws-resources/config/config.yaml) and [domain.yaml](aws-resources/config/infrastructure/domain.yaml) files variables and set the project name, domain zone and cert name according to your project preferences.<br>
  **Note that you'll need to keep the region to us-east-1 (N.Virginia) as this is the only region that works with API Gateway.**
  ```bash
  sceptre --dir ./aws-resources launch-env infrastructure
  ```

4. **Configure service:**

  Get created resources outputs
  ```bash
  sceptre --dir ./aws-resources describe-stack-outputs infrastructure domain
  ```
  Then update the [env-vars.yaml](./env-vars.yaml) properly according to the data outputted by the previous command.

5. **Create the custom domain:**

  ```bash
  serverless create_domain
  ```
6. **Deploy The Service:**

  Use the command below when you want to deploy your service or have made changes to your Functions, Events or Resources in `serverless.yml`.
  ```bash
  serverless deploy -v
  ```

### Other useful commands
- **Deploy a Function:**

  Use this to quickly upload and overwrite your AWS Lambda code on AWS, allowing you to develop faster.
  ```bash
  serverless deploy function -f hello
  ```

- **Invoke a Function:**

  Invokes an AWS Lambda Function on AWS and returns logs.
  ```bash
  serverless invoke -f hello -l
  ```

- **Fetch a Function Logs:**

  Open up a separate tab in your console and stream all logs for a specific Function using this command.
  ```bash
  serverless logs -f hello -t
  ```
- **Remove the created custom domain:**
  ```bash
  serverless delete_domain
  ```

- **Remove the Service:**

  Removes all Functions, Events and Resources from your AWS account.
  ```bash
  serverless remove
  ```

### Useful documentation and guides
* [How to set up a custom domain name for Lambda & API Gateway with Serverless](https://serverless.com/blog/serverless-api-gateway-domain/)
* [How to deploy multiple micro-services under one API domain with Serverless](https://serverless.com/blog/api-gateway-multiple-services/)
