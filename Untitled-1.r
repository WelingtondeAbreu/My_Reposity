def main():
    # Passo 1: Mensagem inicial e espera pelo Enter
    print("Este programa tem por objetivo auxiliar os gestores a estimar o impacto ambiental provocado pela implantação da compostagem na escola.")
    input("Pressione Enter para continuar...")

    while True:
        # Passo 2: Menu de opções
        print("\nDigite o número da opção desejada:")
        print("1 - Sei quanto de resíduo orgânico nossa escola produz por dia.")
        print("2 - Ainda não sei o quanto de resíduo orgânico nossa escola produz por dia.")
        print("3 - Sair.")
        
        opcao = input("Opção: ")

        # Passo 3: Tratamento das opções
        if opcao == "3":
            print("Programa encerrado.")
            break  # Sai do loop e encerra o programa

        elif opcao == "1":
            # Caminho 1: Usuário sabe a quantidade de resíduo orgânico
            try:
                residuo_dia = float(input("\n1º - Qual o valor de resíduo orgânico produzido por dia na escola? (em Kg): "))
                dias_letivo = int(input("2º - Quantos dias tem o ano letivo? (Caso não saiba, recomenda-se que use 200): "))
                
                # Cálculo 1: Quantidade de resíduo compostado no ano (em kg)
                residuo_ano_kg = residuo_dia * dias_letivo
                print(f"\nA quantidade de resíduo compostado ao longo do ano letivo será de {residuo_ano_kg:.2f} kg.")

                # Cálculo 2: Metano evitado (metodologia IPCC - fórmula do TCC)
                M = residuo_ano_kg / 1000  # Convertendo kg para toneladas (para uso na fórmula)
                DOC = 0.5  # Fração de carbono degradável
                BO = 80  # Potencial biogênico de metano (m³ de CH₄ por tonelada de resíduo)
                F = 0.5  # Fração de metano recuperado no aterro
                densidade_metano = 0.0007168  # Densidade do metano (ton/m³)

                CH4_evitado_ton = M * DOC * BO * (1 - F) * densidade_metano
                CH4_evitado_kg = CH4_evitado_ton * 1000  # Convertendo toneladas para kg
                print(f"A quantidade de metano (CH₄) evitada será de {CH4_evitado_kg:.2f} kg.")

                # Cálculo 3: CO₂ evitado
                GWP = 28  # Potencial de aquecimento global do CH₄
                CO2_evitado_ton = CH4_evitado_ton * GWP
                CO2_evitado_kg = CO2_evitado_ton * 1000  # Convertendo toneladas para kg
                print(f"A quantidade de CO₂ evitada será de {CO2_evitado_kg:.2f} kg.")

            except ValueError:
                print("Erro: Entrada inválida. Certifique-se de digitar números válidos.")

        elif opcao == "2":
            # Caminho 2: Usuário não sabe a quantidade de resíduo orgânico
            try:
                alunos = int(input("\nQuantos alunos possui na escola? "))
                funcionarios = int(input("Quantos funcionários trabalham na escola? "))
                professores = int(input("Quantos professores tem na escola? "))
                dias_letivo = int(input("Quantos dias tem o ano letivo? (Caso não saiba, recomenda-se que use 200): "))

                # Cálculo 1: Quantidade de resíduo orgânico por dia
                total_pessoas = alunos + funcionarios + professores
                residuo_dia_kg = total_pessoas * 0.044  # 0,044 kg/pessoa/dia
                print(f"\nA escola produz aproximadamente {residuo_dia_kg:.2f} kg de resíduo orgânico por dia.")

                # Cálculo 2: Quantidade de resíduo compostado no ano (em kg)
                residuo_ano_kg = residuo_dia_kg * dias_letivo
                print(f"A quantidade de resíduo compostado ao longo do ano letivo será de {residuo_ano_kg:.2f} kg.")

                # Cálculo 3: Metano evitado (metodologia IPCC - fórmula do TCC)
                M = residuo_ano_kg / 1000  # Convertendo kg para toneladas (para uso na fórmula)
                DOC = 0.5  # Fração de carbono degradável
                BO = 80  # Potencial biogênico de metano (m³ de CH₄ por tonelada de resíduo)
                F = 0.5  # Fração de metano recuperado no aterro
                densidade_metano = 0.0007168  # Densidade do metano (ton/m³)

                CH4_evitado_ton = M * DOC * BO * (1 - F) * densidade_metano
                CH4_evitado_kg = CH4_evitado_ton * 1000  # Convertendo toneladas para kg
                print(f"A quantidade de metano (CH₄) evitada será de {CH4_evitado_kg:.2f} kg.")

                # Cálculo 4: CO₂ evitado
                GWP = 28  # Potencial de aquecimento global do CH₄
                CO2_evitado_ton = CH4_evitado_ton * GWP
                CO2_evitado_kg = CO2_evitado_ton * 1000  # Convertendo toneladas para kg
                print(f"A quantidade de CO₂ evitada será de {CO2_evitado_kg:.2f} kg.")

            except ValueError:
                print("Erro: Entrada inválida. Certifique-se de digitar números válidos.")

        else:
            print("Opção inválida. Por favor, escolha uma opção entre 1, 2 ou 3.")

if __name__ == "__main__":
    main()