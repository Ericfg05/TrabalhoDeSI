**Trabalho final de Segurança da informação**

***Hadware utilizado***

  Para o plano atual de hospedagem de aplicações web, é necessário uma máquina que seja competente para o volume de requisições que será recebido dos possíveis projetos que foram pensados. Nesse cenário, espera-se que o servidor receba 10 sites ou aplicações pequenos/médios, podendo haver exceções para alguns sites ou aplicações grandes(no máximo 4 requisições por segundo) cerca de 3.456.000 requisições por dia. Com esses requisitos levantados, será necessário uma máquina avaliado em R$33.999,00, sendo um servidor da dell o Servidor Torre PowerEdge T560, equipado com um processador de 12 núcleos e 20 threads, o poderosíssimo Intel® Xeon® Silver 4410Y. Com ele, será equipado dois pentes de 16 gigas de ram, totalizando 32 gigas de memória ram, com 4800MT/s de transferência,no entanto, será a feito um pedido especial para que possa ser utilizado 150gb de ram que ficá em torno de 9000 a mais no orçamento. E com isso adicionando mais 2 Teras de SSD usando o espelhamento RAID 1, que é utilizado em uma partição para backup dos arquivos importantes do sistema. 
	Essa configuração escolhida possui o sistema operacional Windows Server 2022 Standard, no entanto, a equipe de infra, decidiu que, seŕa totalmente alterado o sistema operacional, e será implementado um ubuntu server para ser sistema que será gerenciado pela equipe e para completar o processo 2 placas de redes de 10GB de Downloads e 8GB de Upload para ter conexão rapida e instável.

 ***Por que essa configuração?***

Essa configuranção foi seleciona para sustentabilizar os sistemas. Com uso de 150gb de ram, vem para tentar suprir a necessidade em suportar as requisições visto que todos os sites vão possuir acesso a banco de dados é para isso tudo funcionar de forma rapida e acertiva, também fazemos a aquisição do SSD, por uma velocidade de transferenca alta. A escolha do processador foi feita devida a quantidade de threads que ele possui, assim, o processador teria recursos suficientes para que seja feita o processamento das atividades feita pelos sites.

***Qual tipo de site pode ser alocado em nosso servidor?***

Qualquer site que possua a media de 4 requisições p/s, sendo, sites de compras e vendas onlines, sites/aplicações empresariais, site com conexão com banco de dados.

***Recursos de segurança***

O servidor deve estar devidamenter seguro, para que seja atingido essa necessidade, será feito algumas implementações para ter um impacto siguinificativo na segurança do servidor. Serviços que serão implementados:
	- TLS ou SSL;
 	-Firewall;
	-Xinetd;
 ***Razão de uso de cada Ferramentas***

 **TLS ou SSL:** Essa ferramenta foi escolhido por ser uma ferramenta com capacidade de criptografar as requisições entre usuario e servidor, sendo, muito util para transação com uso de cartão de crédito 
