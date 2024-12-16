# Jobs de build e push no dockerhub, e adicionando no repositorio das logs de incremento de versão
- Os passos a seguir, é a configuração de uma pipeline para que as variaveis consigam ser acessada nas secrets. Qualquer push feito na branch main, vai ser acionado os jobs.

- Será necessário criar secrets no GitHub Actions para poder acessar o dockerhub e para acessar github para commit

- No seu repositóri vá em: settings > Secrets and variables (no menu lateral esquerdo) > Acitons 
em Repository secrets, clique em New repository secret. 

- Na página Actions secrets / New secret, adicione uma variável DOCKERHUB_USERNAME e em Secrets, adicione o seu usuário do dockerhub. Faça o mesmo com a senha, crie uma variável chamada DOCKERHUB_PASSWORD e em secret, adicione sua senha. 

- **(Opcional)** caso queira o versionamento de imagem: Repita o mesmo processo com login e senha do github, com as variaveis GH_USERNAME e GH_PASSWORD
#
## Protegendo a branch main, para que um merge possa ser feito apenas se um pull request e a pipeline sejam concluídos
### Restrições
- Nessas restrições, não vai permitir **push** diretamente na branch **main** e permitir apenas que um **pull request** seja **mesclado** (merge) com a branch **main** se o **job (ci)** passar, ou seja, se o **ci** for **concluído** com sucesso

## Passos e configurações das restrições de branch:
- vá em settings > branches (no menu lateral esquerdo) > Add branch ruleset

- **Ruleset Name:** Defina um **nome** para o Ruleset

- **Enforcement status:** Active, ativando as regras

- **Bypass list** Basicamente é tudo, seja pessoas, organizações, times que podem ignorar as regras, deixar vazio do jeito que está.

- **Target branches** Defina a branche que será aplicada a regra, **clique** em Add Target > Include default branch

- **Rules:** Desmarque a opção **Restrict deletions** e marque a opção **Require a pull request before merging** para exigir que um pull request seja feito antes de fazer um merge, em **Required approvals** deixe 0, se a organização tiver mais pessoas é interessante marcar 1 ou mais pessoas para autorizar o pull request, marque a opção 
**Require status checks to pass** para garantir que **pull request** seja feito apenas se a verificação do **ci** for **concluída**: Clique em Add checks > -digite o nome do job- > selecione o job. Deixe marcado a opção **Block force pushes** e por fim, clique em **create** se retornar a mensagem: **Ruleset created** deu tudo certo, a partir de agora, não é possível fazer um push diretamente na main, será necessário realizar um pull request e este pull request só vai ser com **sucesso** se o job **ci** for **concluído** com sucesso

- crie uma nova branch e mude para ela
```bash
git switch -c pull_request
```

- com essa alteração, adicionei essas modificação no meu repositorio na branch pull_request
```bash
git add dxxxx
git commit -m "xxxx"
git push origin pull_request
```
