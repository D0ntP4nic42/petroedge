- Garantir a build da imagem junto com a versão da aplicação, docker image ls
- Carregar a imagem no minikube com minikube image load <nome_da_imagem:versão>
- minikube image ls para ver se a imagem foi carregada
- Subir tudo com kubectl apply -k operational/deploy/k8s/demo/
- kubectl get pods -n petroedge para ver se subiu
- kubectl port-forward -n petroedge svc/operational porta:porta (nunca lembro qual é host e qual é pod, coloca igual que não tem erro)
- kubectl logs -f <id_do_pod> -n petroedge para ver os logs, o id do pod aparece em kubectl get pods -n petroedge

O que falta:
- Ver como o elixir trata o env para configurar o ambiente no demo/kustomization e não deixar as variáveis hardcoded espalhadas pelos manifestos. (Teoricamente é opcional, deveria funcionar sem isso mas é bom fazer)
- Preencher o demo/kustomization com as variáveis que ele deve injetar no env. Em java algo como ${DATABASE_URL:postgres://operational:operational_dev@localhost:5432/operational?sslmode=disable} no propeties ele entende que o primeiro valor vai ser injeção e caso não tenha ele usa o Fallback, não sei em elixir
- Build da imagem, não faço ideia de como faz Dockerfile para Elixir, teoricamente é só fazer, buildar e carregar a imagem no minikube

O que pode ser ajustado:
- Porta do serviço pode ser alterada em service.yaml e no deployment.yaml
- Variáveis de ambiente geralmente ficam em config.yaml separadas em Secret e Config
- O recurso que o pod vai usar pode ser alterado em deployment.yaml (memória e cpu)
- Em geral a mesma coisa vale para o banco